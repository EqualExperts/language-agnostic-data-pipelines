(defproject migrator "0.1.0"
  :description ""
  :min-lein-version "2.0.0"
  :dependencies [[org.clojure/clojure "1.10.1"]
                 [ragtime "0.8.0"]
                 [org.postgresql/postgresql "42.2.18"]
                 [org.clojure/java.jdbc "0.7.11"]
                 [ch.qos.logback/logback-classic "1.2.3"]
                 [ch.qos.logback/logback-core "1.2.3"]
                 [net.logstash.logback/logstash-logback-encoder "5.3" :upgrade false]
                 [org.codehaus.janino/janino "3.1.2"] ; for Logback-config
                 [org.clojure/tools.logging "1.1.0"]
                 [clj-time "0.15.2"]
                 [com.grammarly/omniconf "0.4.2"]]
  :main migrator.root
  :uberjar-name "migrator.jar"
  :plugins [[lein-ancient "0.6.15"]]
  :resource-paths ["resources"]
  :profiles {:dev {:dependencies [[org.clojure/tools.namespace "0.2.11" :upgrade false]]
                   :source-paths ["dev"]
                   :repl-options {:init-ns user}}
             :uberjar {:aot :all}}
  :aliases {"migrate"  ["run" "-m" "migrator.migrate/perform-migrate-process"]
            "rollback" ["run" "-m" "migrator.migrate/perform-rollback-process"]})
