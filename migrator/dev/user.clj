(ns user 
  (:require clojure.test
            [clojure.tools.logging :as log :refer [*logger-factory*]]
            [clojure.tools.logging.impl :refer [disabled-logger-factory]]
            [clojure.java.shell :refer [sh]]
            [clojure.tools.namespace.repl :refer [refresh refresh-all]]
            [migrator.migrate :refer [perform-migrate   perform-rollback]]))

(defn run-tests
  "Refresh all code, then run tests (w/ logging disabled)"
  []
  (binding [*logger-factory* disabled-logger-factory]
    (let [result (refresh-all)]
      (if (= :ok result)
        (clojure.test/run-all-tests #"^covid19-uk-ingestions.*-test$")
        (prn result)))))
