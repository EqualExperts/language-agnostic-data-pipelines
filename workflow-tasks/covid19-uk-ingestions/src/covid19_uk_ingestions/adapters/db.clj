(ns covid19-uk-ingestions.adapters.db
  (:require [next.jdbc.sql :as sql]
            [java-time :as time]))

(def ^:private table-name "covid_19_ingestion")
(def ^:private cols ["day" "payload"])
(def ^:private on-conflict-clause "ON CONFLICT (day) DO UPDATE SET payload=excluded.payload, updated_at = DEFAULT")

(def ^:private default-last-ingested-date "2019-12-31")

(defn insert-rows
  [db data]
  (let [rows (map vals data)]
    (sql/insert-multi! db
                       table-name
                       cols
                       rows
                       {:suffix on-conflict-clause})))

(defn last-ingested-date
  [db]
  (let [query-sql (format "SELECT coalesce(max(day),'%s') as date FROM %s WHERE payload != '[]'::jsonb" default-last-ingested-date table-name)]
    (->> (sql/query db [query-sql])
         first
         :date
         time/local-date)))


