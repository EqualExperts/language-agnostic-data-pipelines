(ns covid19-uk-ingestions.adapters.api-test
  (:require [clj-http.client :as client]
            [clojure.test :refer :all]
            [covid19-uk-ingestions.adapters.api :as sut]
            [java-time :as time]
            ))

(def date (time/local-date 2021 1 1))
(def url "https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england;date=2021-01-01&structure={\"date\":\"date\",\"newCases\":\"newCasesByPublishDate\"}")
(def api-response {:body "{\"data\":[{\"date\":\"2021-01-01\",\"newCases\":50746}]}"})
(def expected {:day date :payload [{:date     "2021-01-01",
                                            :newCases 50746}]})

(deftest fetch-covid-data-params-test
  (testing "should call api for a date and return the payload"
    (let [calls (atom [])]
      (with-redefs [client/get (fn [param]
                                 (swap! calls conj param)
                                 api-response)]
        (let [response (sut/fetch-date date)]
          (is (= url (first @calls)))
          (is (= expected response)))))))