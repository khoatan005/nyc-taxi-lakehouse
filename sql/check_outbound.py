# Dán vào 1 notebook serverless để biết Databricks có tải thẳng được dữ liệu nguồn không
import requests

urls = [
    "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet",
    "https://archive-api.open-meteo.com/v1/archive?latitude=40.71&longitude=-74.01"
    "&start_date=2024-01-01&end_date=2024-01-02&daily=temperature_2m_mean",
]
for u in urls:
    try:
        r = requests.get(u, stream=True, timeout=20)
        print(r.status_code, u[:60])
    except Exception as e:
        print("BLOCKED", u[:60], type(e).__name__)
