(ns common.database.migrations
  (:require [omniconf.core :as cfg]
            [clojure.java.io :as io]
            [clojure.tools.logging :as log]
            [ragtime.jdbc :as sql]
            [ragtime.repl :as repl]
            [common.database.core :as db-core]))

(defn- reporter
  [_ op id]
  (case op
    :up   (log/info "Applying" id)
    :down (log/info "Rolling back" id)))

(defn- load-config
  [config]
  {:datastore  (sql/sql-database config)
   :migrations (sql/load-resources "db-migrations")
   :reporter reporter})

(defn perform-migrate
  [config]
  (-> config
      (load-config)
      repl/migrate))

(defn perform-rollback
  [config]
  (-> config
      (load-config)
      repl/rollback))

(defn- setup-db-config
  [profile]

  (cfg/define db-core/db-config)

  (prn "PROFILE" profile)
  (cfg/populate-from-file (io/resource (str profile ".config.edn")))

  (cfg/get :db))

(defn perform-db-migrations
  [& args]
  (-> args
      (or #(-> % first) "dev")
      setup-db-config
      perform-migrate))
;;   (let [profile (or (-> args first) "dev")]
;;     (perform-migrate (setup-db-config profile)))

(defn rollback-previous-migration
  [& args]
  (-> args
      (or #(-> % first) "dev")
      setup-db-config
      perform-rollback))
;;   (let [profile (or (-> args first) "dev")]
;;     (perform-rollback (setup-db-config profile))))