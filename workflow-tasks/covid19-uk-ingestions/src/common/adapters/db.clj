(ns common.adapters.db
(:import org.postgresql.util.PGobject)
(:require [next.jdbc.prepare :as prepare]
  [next.jdbc.result-set :as rs]
  [cheshire.core :as json]
  [omniconf.core :as cfg]
  [next.jdbc.date-time :as date-time])
(:import com.mchange.v2.c3p0.ComboPooledDataSource))


(def db-config
  {:db {:nested {:dbtype {:description "type of the database"
                          :type :string
                          :default "postgresql"}
                 :dbname {:description "name of the database"
                          :type :string
                          :required true}
                 :host {:description "host URL of database"
                        :type :string
                        :required true}
                 :port {:description "database port"
                        :type :number
                        :required true}
                 :user {:description "username login for database"
                        :type :string
                        :required true}
                 :password {:description "password login for database"
                            :type :string
                            :secret true
                            :required true}}}})

(defn- build-jdbc-url
  [config]
  (str
    "jdbc:"
    (:dbtype config)
    "://"
    (:host config)
    ":"
    (:port config)
    "/"
    (:dbname config)))

(defn- create-connection-pool [config]
  (doto (ComboPooledDataSource.)
    (.setDriverClass (:classname config))
    (.setJdbcUrl (build-jdbc-url config))
    (.setUser (:user config))
    (.setPassword (:password config))
    (.setMaxIdleTimeExcessConnections (* 30 60))
    (.setMaxIdleTime (* 3 60 60))))


(defn setup-db []
  (cfg/set :db (create-connection-pool  (cfg/get :db))))


(def ->json json/generate-string)
(def <-json #(json/parse-string-strict % true))

(defn ->pgobject
  [x]
  (doto (PGobject.)
    (.setType "jsonb")
    (.setValue (->json x))))

(defn <-pgobject
  [^org.postgresql.util.PGobject v]
  (let [type  (.getType v)
        value (.getValue v)]
    (if (#{"jsonb" "json"} type)
      (<-json value) value)))

(extend-protocol prepare/SettableParameter
  clojure.lang.IPersistentMap
  (set-parameter [m s i]
    (.setObject s i (->pgobject m)))

  clojure.lang.IPersistentVector
  (set-parameter [v s i]
    (.setObject s i (->pgobject v))))

(extend-protocol rs/ReadableColumn
  org.postgresql.util.PGobject
  (read-column-by-label [^org.postgresql.util.PGobject v _]
    (<-pgobject v))
  (read-column-by-index [^org.postgresql.util.PGobject v _2 _3]
    (<-pgobject v)))

(date-time/read-as-default)