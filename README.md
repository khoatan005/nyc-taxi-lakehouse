# NYC Taxi Lakehouse

Pipeline batch end-to-end: NYC Yellow Taxi + thời tiết -> Databricks (Delta, medallion) -> dbt -> Power BI, điều phối bằng Airflow, deploy bằng Asset Bundles + GitHub Actions.

## Kiến trúc

```
[Airflow local]  extract (TLC parquet + Open-Meteo) -> upload UC Volume -> trigger job
[Databricks]     landing -> bronze (PySpark) -> silver -> gold (dbt)
[Power BI]       <- Databricks SQL warehouse
[GitHub Actions] lint + dbt build trên PR, bundle deploy khi merge
```

## Cấu trúc

| Thư mục | Nội dung |
|---|---|
| `extract/` | Script tải dữ liệu nguồn và upload lên Volume |
| `bronze/` | PySpark job nạp landing -> bronze |
| `dbt/` | Model silver, gold, tests |
| `airflow/` | DAG điều phối |
| `resources/` | Định nghĩa job cho Asset Bundles |
| `sql/` | Script setup một lần |

## Setup

```powershell
uv sync --group dev
copy .env.example .env   # điền host, token, http_path
databricks auth login --host <workspace-url>
```

Chạy `sql/setup_catalog.sql` trong SQL Editor của Databricks.

## Roadmap

- [ ] Tuần 1: tài khoản, CLI, repo, schema dev/prod
- [ ] Tuần 2: extract + upload 1 tháng lên Volume
- [ ] Tuần 3: bronze job PySpark, idempotent theo tháng
- [ ] Tuần 4: dbt setup + silver trips
- [ ] Tuần 5: silver weather/zone + gold star schema
- [ ] Tuần 6: incremental model + mart
- [ ] Tuần 7: Airflow DAG end-to-end
- [ ] Tuần 8: backfill 24 tháng, retry, alert
- [ ] Tuần 9: Asset Bundles, tách dev/prod
- [ ] Tuần 10: GitHub Actions: sqlfluff, dbt build trên PR
- [ ] Tuần 11: Power BI dashboard
- [ ] Tuần 12: docs, dbt docs, bài tóm tắt
- [ ] Giai đoạn 2: Kafka + Structured Streaming
