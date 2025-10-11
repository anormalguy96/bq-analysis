import json
from google.cloud import bigquery
import os

PROJECT = os.environ.get("GCP_PROJECT", "myproj")
RAW_DATASET = os.environ.get("RAW_DATASET", "raw")
client = bigquery.Client(project=PROJECT)

def load_jsonl(local_path, table_id):
    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.NEWLINE_DELIMITED_JSON,
        autodetect=True,
        write_disposition="WRITE_TRUNCATE",
    )
    with open(local_path, "rb") as f:
        load_job = client.load_table_from_file(f, table=table_id, job_config=job_config)
    load_job.result()
    print(f"Loaded {local_path} -> {table_id}")

if __name__ == "__main__":
    # make sure dataset exists
    ds_ref = bigquery.Dataset(f"{PROJECT}.{RAW_DATASET}")
    try:
        client.get_dataset(ds_ref)
    except Exception:
        ds = bigquery.Dataset(ds_ref)
        ds.location = "US"
        client.create_dataset(ds)
        print("Created dataset", ds_ref)

    load_jsonl("data/sample_events.jsonl", f"{PROJECT}.{RAW_DATASET}.events")
    load_jsonl("data/sample_orders.jsonl", f"{PROJECT}.{RAW_DATASET}.orders")
    print("Sample load complete.")
