run_tests:
	lein test

create_uberjar:
	lein do clean, uberjar

create_migrator_uberjar:
	lein with-profile db-migrations do clean, uberjar

.PHONY:  run_tests create_uberjar

