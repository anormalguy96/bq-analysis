.PHONY: setup load-sample run-dbt

setup:
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt

# load local sample files into BigQuery (requires GOOGLE_APPLICATION_CREDENTIALS set)
load-sample:
	python scripts/load_sample_to_bq.py

run-dbt:
	# ensure you have profiles.yml configured (see dbt/profiles.example.yml)
	dbt --version || true
	cd dbt && dbt deps && dbt seed --profiles-dir .. && dbt run --profiles-dir ..