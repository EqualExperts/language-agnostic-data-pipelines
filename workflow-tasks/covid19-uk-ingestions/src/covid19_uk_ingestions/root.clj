(ns covid19-uk-ingestions.root
  (:require [omniconf.core :as cfg]
            [clojure.java.io :as io]
            [common.database.core :as core-db]
            [covid19-uk-ingestions.job :as job])
  (:gen-class))

(def ingestion-config
  (merge core-db/db-config
         {:start-date {:description "Start Date for backfill ingestion"
                       :type :string
                       :default nil}
          :end-date {:description "End Date for backfill ingestions"
                     :type :string
                     :default nil}}))

(cfg/define ingestion-config)

(defn- load-config-from-args
  [args]
  (let [profile (name (or (-> args first) "dev"))
        config-file (io/resource (str (name profile) ".config.edn"))]
    (cfg/populate-from-file config-file true)
    (cfg/populate-from-cmd (drop 1 args) true)))

(defn -main
  [& args]
  (load-config-from-args args)
  (core-db/setup-db)
  (job/perform! (cfg/get)))
