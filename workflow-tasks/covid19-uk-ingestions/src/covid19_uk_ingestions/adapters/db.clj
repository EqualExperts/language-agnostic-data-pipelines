(ns covid19-uk-ingestions.adapters.db
  (:require [next.jdbc.sql :as sql]
            [java-time :as time]))


(def table-name "covid_19_ingestion")
(def cols ["day" "payload"])
(def on-conflict-clause "ON CONFLICT (day) DO UPDATE SET payload=excluded.payload, updated_at = now()")

(defn insert-rows [db data]
  (let [rows (mapv vals data)]
    (sql/insert-multi! db table-name cols rows {:suffix on-conflict-clause})))

(defn last-ingested-date [db]
  (-> (sql/query db ["SELECT coalesce(max(day),'2019-12-31') as date FROM covid_19_ingestion"]) first :date time/local-date))


