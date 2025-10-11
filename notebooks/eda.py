from google.cloud import bigquery
import os

PROJECT = os.environ.get("GCP_PROJECT", "myproj")
ANALYTICS = os.environ.get("ANALYTICS_DATASET", "analytics")
client = bigquery.Client(project=PROJECT)

def main():
    print("Listing staged events sample...")
    sql = f"SELECT event_name, COUNT(1) AS cnt FROM `{PROJECT}.{ANALYTICS}.stg_events` GROUP BY event_name"
    df = client.query(sql).to_dataframe()
    print(df.to_string(index=False))

if __name__ == "__main__":
    main()