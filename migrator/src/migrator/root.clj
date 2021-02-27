(ns migrator.root
  (:gen-class)
  (:require [migrator.migrate :as migrate]))

(defn -main [& args]
  (apply migrate/perform-migrate-process args))
