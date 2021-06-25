(defproject covid19-uk-ingestions "1.0.0"
  :description "Ingests data from covid19-UK API and stores it in a DB"
  :dependencies [[org.clojure/clojure "1.10.2"]
                 [clj-http "3.12.1"]
                 [cheshire "5.10.0"]
                 [ragtime "0.8.0"]
                 [seancorfield/next.jdbc "1.1.613"]
                 [com.grammarly/omniconf "0.4.2"]
                 [org.postgresql/postgresql "42.2.19"]
                 [com.mchange/c3p0 "0.9.5.5"]
                 [clojure.java-time "0.3.2"]]
  :main covid19-uk-ingestions.root
  :plugins [[lein-ancient "0.7.0"]]
  :uberjar-name "covid19-uk-ingestions.jar"
  :resource-paths ["resources"]
  :profiles {:dev {:dependencies [[eftest "0.5.9"]
                                  [org.clojure/tools.namespace "0.2.11" :upgrade false]
                                  [org.testcontainers/postgresql "1.15.2"]
                                  [org.testcontainers/testcontainers "1.15.2"]]
                   :source-paths ["dev"]
                   :repl-options {:init-ns user}}
             :db-migrations { :uberjar-name "db-migrations.jar"
                              :main common.database.migrations
                             
                              :dependencies [] 
                             }

             :uberjar {:aot :all}})
