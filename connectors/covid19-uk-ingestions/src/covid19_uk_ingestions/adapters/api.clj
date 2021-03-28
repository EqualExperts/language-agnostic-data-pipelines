(ns covid19-uk-ingestions.adapters.api
  (:require [clj-http.client :as client]
            [cheshire.core :as json]
            [java-time :as time]))

(def url "https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england;date=%s&structure={\"date\":\"date\",\"newCases\":\"newCasesByPublishDate\"}")
(def date-format "yyyy-MM-dd")

(defn fetch-date
  [local-date]
  (let [request-url (format url (time/format date-format local-date))
        result (client/get request-url)]
    {:day local-date
     :payload (-> result :body (json/parse-string true) :data)}))
