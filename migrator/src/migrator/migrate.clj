(ns migrator.migrate
  (:require [omniconf.core :as cfg]
            [clojure.java.io :as io]
            [clj-time.core :as t]
            [clj-time.format :as f]
            [clojure.tools.logging :as log]
            [ragtime.jdbc :as sql]
            [ragtime.repl :as repl]))

(defn- reporter
  [_ op id]
  (case op
    :up   (log/info "Applying" id)
    :down (log/info "Rolling back" id)))

(defn- load-config
  [config]
  {:datastore  (sql/sql-database config)
   :migrations (sql/load-resources "migrations")
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

(defn- setup-db-config [profile]
  (cfg/define
    {:db {:nested {:dbtype {:description "type of database"
                            :type :string
                            :required true
                            :default "postgresql"}
                   :dbname {:description "name of database"
                            :type :string
                            :required true}
                   :host {:description "host URL of database"
                          :type :string
                          :required true}
                   :port {:description "database port"
                          :type :number
                          :required true}
                   :user {:description "username login for the database"
                          :type :string
                          :required true}
                   :password {:description "password login for database"
                              :type :string
                              :secret true
                              :required true}}}})

  (cfg/populate-from-file (io/resource (str profile ".config.edn")))

  (cfg/get :db))

(defn perform-migrate-process
  [& args]
  (let [profile (or (-> args first) "dev")]
    (perform-migrate (setup-db-config profile))))

(defn perform-rollback-process
  [& args]
  (let [profile (or (-> args first) "dev")]
    (perform-rollback (setup-db-config profile))))