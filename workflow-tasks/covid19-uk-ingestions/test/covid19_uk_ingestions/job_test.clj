(ns covid19-uk-ingestions.job-test
  (:require [clojure.test :refer [is testing]]
            [test-helpers.test :refer [deftest-with-db *db*]]
            [java-time :as time]
            [clj-http.client :as client]
            [next.jdbc.sql :as sql]
            [next.jdbc.result-set :as result-set]
            [covid19-uk-ingestions.adapters.api :as covid-api]
            [covid19-uk-ingestions.job :as sut]))


(def api-fixtures {"2020-01-01" {:body "{\"data\":[{\"date\":\"2020-01-01\",\"newCases\":50746}]}"}
                   "2020-01-02" {:body "{\"data\":[{\"date\":\"2020-01-02\",\"newCases\":50744}]}"}
                   "2020-01-03" {:body "{\"data\":[{\"date\":\"2020-01-03\",\"newCases\":50743}]}"}})

(def expectations  [{:day #inst "2020-01-01T00:00:00" :payload [{:date "2020-01-01" :newCases 50746}]}
                    {:day #inst "2020-01-02T00:00:00" :payload [{:date "2020-01-02" :newCases 50744}]}
                    {:day #inst "2020-01-03T00:00:00" :payload [{:date "2020-01-03" :newCases 50743}]}])

(defn- query-order-by-day
  [db]
  (sql/query db
             ["SELECT * FROM covid_19_ingestion ORDER BY day;"]
             {:builder-fn result-set/as-unqualified-lower-maps}))

(defn- extract-date-from-url
  [url]
  (->> url
       (re-find #"date=(.*)&structure")
       second))

(defn- get-api-fixtures
  [url fixtures]
  (->> url
       extract-date-from-url
       (get fixtures)))

(deftest-with-db ingest-without-explicit-interval-test
  (testing "should call api and save payloads for all the dates since last ingestion until today's date"
    (let [{:keys [db] :as config} {:db *db*}]
      (with-redefs [client/get (fn [url]
                                 (get-api-fixtures url api-fixtures))
                    sut/today (constantly (time/local-date covid-api/date-format "2020-01-03"))]

        (sut/perform! config))

      (let [rows (query-order-by-day db)]
        (is (= expectations
               (map #(select-keys % [:day :payload]) rows)))))))

(deftest-with-db ingest-with-explicit-time-interval-test
  (testing "should call api and save payloads for all the dates included in the interval (inclusively)"
    (let [{:keys [db] :as config} {:db *db*
                                   :start-date "2020-01-01"
                                   :end-date "2020-01-02"}]

      (with-redefs [client/get (fn [url] (get-api-fixtures url api-fixtures))]
        (sut/perform! config))

      (let [rows (query-order-by-day db)]
        (is (= (take 2 expectations)
               (map #(select-keys % [:day :payload]) rows)))))))

(deftest-with-db ingest-since-last-ingestion-test
  (testing "should call api and save payloads for all the dates since last ingestion until today's date"
    (let [{:keys [db] :as config} {:db *db*}]

      (sql/insert! db "covid_19_ingestion" (get expectations 1))

      (with-redefs [client/get (constantly (get api-fixtures "2020-01-03"))
                    sut/today (constantly (time/local-date covid-api/date-format "2020-01-03"))]

        (sut/perform! config))

      (let [rows (query-order-by-day db)]
        (is (= (drop 1 expectations)
               (map #(select-keys % [:day :payload]) rows)))))))


(deftest-with-db re-ingest-with-explicit-time-interval-should-update-or-insert-test
  (testing "should call api and upsert payloads"
    (let [{:keys [db] :as config} {:db *db*
                                   :start-date "2020-01-01"
                                   :end-date "2020-01-03"}
          re-ingested-api-fixtures {"2020-01-01" {:body "{\"data\":[{\"date\":\"2020-01-01\",\"newCases\":10}]}"}
                                    "2020-01-02" {:body "{\"data\":[{\"date\":\"2020-01-02\",\"newCases\":10}]}"}
                                    "2020-01-03" {:body "{\"data\":[{\"date\":\"2020-01-03\",\"newCases\":10}]}"}}
          new-expectations (map #(assoc-in % [:payload 0 :newCases] 10) expectations)]

      (sql/insert! db "covid_19_ingestion" (get expectations 1))

      (with-redefs [client/get (fn [url] (get-api-fixtures url re-ingested-api-fixtures))]
        (sut/perform! config))

      (let [rows (query-order-by-day db)]

        (is (= new-expectations
               (map #(select-keys % [:day :payload]) rows)))))))



(deftest-with-db ingest-with-api-error-test
  (testing "when api returns an error should not store anything on DB and throw the exception"
    (let [{:keys [db] :as config} {:db *db*}]

      (with-redefs [client/get (fn [_url] (throw (ex-info "Error thrown from API" {})))]

        (is (thrown? clojure.lang.ExceptionInfo
                     (sut/perform! config))))

      (is (empty? (query-order-by-day db))))))
