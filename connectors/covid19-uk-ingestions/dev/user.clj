(ns user
  (:require [eftest.runner :as ef]
            [clojure.tools.namespace.repl :refer [refresh-all]]
            [common.database.migrations :refer [perform-db-migrations rollback-previous-migration]]))

(defn run-tests
  "Refresh all code, then run tests"
  []
  (let [result (refresh-all)
        test-dirs ["test"]]
    (if (= :ok result)
      (ef/run-tests (ef/find-tests test-dirs) {:multithread? false})
      (prn result))))
