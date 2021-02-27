(ns covid19-uk-ingestions.core
  (:require [omniconf.core :as cfg]
            [clojure.java.io :as io]
            [covid19-uk-ingestions.adapters.db :as covid-db]
            [covid19-uk-ingestions.adapters.api :as covid-api]
            [common.adapters.db :as db]
            [java-time :as time]
            [clojure.string :as s])
  (:gen-class))


(defn config-for
  [profile]
   (cfg/populate-from-file (io/resource (str (name profile) ".config.edn")) true))

(defn- today []  (time/local-date))

(defn- get-ingestion-interval
  [db [start end]]
  (if (or (s/blank? start) (s/blank? end))
    (let [start (time/plus (covid-db/last-ingested-date db) (time/days 1))
          end (today)]
      {:start start
       :end end})
    {:start (time/local-date covid-api/date-format start)
     :end (time/local-date covid-api/date-format end)}))

(defn ingest-time-interval
  ([db args]
  (let [interval (get-ingestion-interval db args)
        end-plus-1-day (time/plus (:end interval) (time/days 1))]
    (loop [date (:start interval)]
      (if (.isAfter end-plus-1-day date)
        (let [data (covid-api/fetch-date date)]
          (covid-db/insert-rows db [data])
          (recur (time/plus date (time/days 1)))))))))

(defn -main
  [& args]
  (let [profile (name (or (-> args first) "dev"))
        _ (config-for profile)
        db (db/setup-db)]
    (ingest-time-interval db (drop 1 args))))
