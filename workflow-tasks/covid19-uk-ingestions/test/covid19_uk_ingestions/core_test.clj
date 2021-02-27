(ns covid19-uk-ingestions.core-test
  (:require [clojure.test :refer :all]
            [covid19-uk-ingestions.core :as sut]
            [covid19-uk-ingestions.adapters.db :as covid-db]
            [covid19-uk-ingestions.adapters.api :as covid-api]
            [test-helpers.test :refer [deftest-with-db *db*]]
            [clj-http.client :as client]
            [next.jdbc.sql :as sql]
            [next.jdbc.result-set :as result-set]
            [java-time :as time]
            ))

(def fixtures [{:body "{\"data\":[{\"date\":\"2020-01-01\",\"newCases\":50746}]}"}
               {:body "{\"data\":[{\"date\":\"2020-01-02\",\"newCases\":50744}]}"}
               {:body "{\"data\":[{\"date\":\"2020-01-03\",\"newCases\":50743}]}"}])

(def expectations  [{:day #inst "2020-01-01T00:00:00"
           :payload    [{:date     "2020-01-01"
                         :newCases 50746}]}
          {:day #inst "2020-01-02T00:00:00"
           :payload    [{:date     "2020-01-02"
                         :newCases 50744}]}
          {:day #inst "2020-01-03T00:00:00"
           :payload    [{:date     "2020-01-03"
                         :newCases 50743}]}])

(deftest-with-db ingest-without-explicit-interval-test
  (testing "should call api and save payloads for all the dates since last ingestion until today's date"
   (let [calls (atom [])]
     (with-redefs [client/get (fn [param]
                                (let [call-index (count @calls)]
                                (swap! calls conj param)
                                (get fixtures call-index)))
                   sut/today (fn [] (time/local-date covid-api/date-format "2020-01-03"))]
       (sut/ingest-time-interval *db* []))
     (let [rows (sql/query *db*
                           ["SELECT * FROM covid_19_ingestion order by day asc;"]
                           {:builder-fn result-set/as-unqualified-lower-maps})]

       (is (= expectations (map #(select-keys % [:day :payload]) rows)))))))

(deftest-with-db ingest-with-explicit-time-interval-test
  (testing "should call api and save payloads for all the dates included in the interval (inclusively)"
    (let [calls (atom [])

          ]
      (with-redefs [client/get (fn [param]
                                 (let [call-index (count @calls)]
                                                 (swap! calls conj param)
                                                 (get fixtures call-index)))]
        (sut/ingest-time-interval *db* ["2020-01-01" "2020-01-02"]))
        (let [rows (sql/query *db*
                          ["SELECT * FROM covid_19_ingestion order by day asc;"]
                              {:builder-fn result-set/as-unqualified-lower-maps})]
          (is (= (take 2 expectations) (map #(select-keys % [:day :payload]) rows)))))))

(deftest-with-db ingest-since-last-ingestion-test
(testing "should call api and save payloads for all the dates since last ingestion until today's date"
    (with-redefs [client/get (fn [_] (get fixtures 2))
                  sut/today (fn [] (time/local-date covid-api/date-format "2020-01-03"))]
      (sql/insert! *db* "covid_19_ingestion" (get expectations 1))
      (sut/ingest-time-interval *db* []))
    (let [rows (sql/query *db*
                          ["SELECT * FROM covid_19_ingestion order by day asc;"]
                          {:builder-fn result-set/as-unqualified-lower-maps})]
      (is (= (drop 1 expectations) (map #(select-keys % [:day :payload]) rows))))))


(deftest-with-db re-singest-with-explicit-time-interval-should-update-or-insert-test
                 (testing "should call api and upsert payloads"
                   (let [calls (atom [])
                         re-ingested-fixtures [{:body "{\"data\":[{\"date\":\"2020-01-01\",\"newCases\":10}]}"}
                                               {:body "{\"data\":[{\"date\":\"2020-01-02\",\"newCases\":10}]}"}
                                               {:body "{\"data\":[{\"date\":\"2020-01-03\",\"newCases\":10}]}"}]
                         new-expectations (map #(assoc-in % [:payload 0 :newCases] 10) expectations)]
                     (with-redefs [client/get (fn [param]
                                                (let [call-index (count @calls)]
                                                                (swap! calls conj param)
                                                                (get re-ingested-fixtures call-index)))]
                       (sql/insert! *db* "covid_19_ingestion" (get expectations 1))
                       (sut/ingest-time-interval *db* ["2020-01-01" "2020-01-03"]))
                     (let [rows (sql/query *db*
                                           ["SELECT * FROM covid_19_ingestion order by day asc;"]
                                           {:builder-fn result-set/as-unqualified-lower-maps})]
                       (is (= new-expectations (map #(select-keys % [:day :payload]) rows)))))))