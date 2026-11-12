-- Chạy 1 lần trong SQL Editor. dbt tự nối tên: <target schema>_<custom schema> => dev_silver, dev_gold
CREATE SCHEMA IF NOT EXISTS workspace.dev_bronze;
CREATE SCHEMA IF NOT EXISTS workspace.dev_silver;
CREATE SCHEMA IF NOT EXISTS workspace.dev_gold;
CREATE SCHEMA IF NOT EXISTS workspace.prod_bronze;
CREATE SCHEMA IF NOT EXISTS workspace.prod_silver;
CREATE SCHEMA IF NOT EXISTS workspace.prod_gold;

CREATE VOLUME IF NOT EXISTS workspace.dev_bronze.landing;
CREATE VOLUME IF NOT EXISTS workspace.prod_bronze.landing;
