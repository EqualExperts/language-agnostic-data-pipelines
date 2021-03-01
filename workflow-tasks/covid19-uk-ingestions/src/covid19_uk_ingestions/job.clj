(ns covid19-uk-ingestions.job
  (:require [covid19-uk-ingestions.adapters.db :as covid-db]
            [covid19-uk-ingestions.adapters.api :as covid-api]
            [java-time :as time]
            [clojure.string :as s]))

(defn- today
  []
  (time/local-date))

(defn- get-ingestion-interval-from-args
  [{:keys [start-date end-date]}]
  (when-not (or (s/blank? start-date) (s/blank? end-date))
    {:start (time/local-date covid-api/date-format start-date)
     :end (time/local-date covid-api/date-format end-date)}))

(defn- get-ingestion-interval-from-db
  [db]
  {:start (time/plus (covid-db/last-ingested-date db) (time/days 1))
   :end (today)})

(defn- get-ingestion-interval
  [{:keys [db] :as config}]
  (or (get-ingestion-interval-from-args config)
      (get-ingestion-interval-from-db db)))

(defn perform!
  [{:keys [db] :as config}]
  (let [interval (get-ingestion-interval config)]
    (loop [date-to-fetch (:start interval)]
      (let [data (covid-api/fetch-date date-to-fetch)]
        (covid-db/insert-rows db [data]))
      (when (.isBefore date-to-fetch (:end interval))
        (recur (time/plus date-to-fetch (time/days 1)))))))
