(defproject covid19-uk-ingestions "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [clj-http "3.12.1"]
                 [seancorfield/next.jdbc "1.1.613"]
                 [com.grammarly/omniconf "0.4.2"]
                 [cheshire "5.10.0"]
                 [org.postgresql/postgresql "42.2.18"]
                 [com.mchange/c3p0 "0.9.5.5"]
                 [clojure.java-time "0.3.2"]]
  :main ^:skip-aot covid19-uk-ingestions.core
  :resource-paths ["resources"]
  :target-path "target/%s"
  :profiles {:dev {:dependencies [[eftest "0.5.9"]
                                  [org.clojure/tools.namespace "0.2.11" :upgrade false]
                                  [org.testcontainers/postgresql "1.15.1"]
                                  [org.testcontainers/testcontainers "1.15.1"]
                                  [migrator "0.1.0"]]
                   :source-paths ["dev"]
                   :repl-options {:init-ns user}}

             :uberjar {:aot :all}})
