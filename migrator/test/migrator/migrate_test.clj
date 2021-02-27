(ns migrator.migrate-test
  (:require [clojure.test :refer [deftest is]]
            [clj-time.coerce :as c]
            [migrator.migrate :as sut]))

(deftest create-migration-filename-test
  (let [description "create-my-table"
        timestamp  (c/from-string "2018-12-01T04:03:27")
        result (sut/create-migration-filename description timestamp)]
    (is (= (str "resources/migrations/20181201040327-" description ".edn")
           result))))
