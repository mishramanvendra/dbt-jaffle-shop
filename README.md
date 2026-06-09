# dbt Jaffle Shop — Analytics Engineering Portfolio Project

A layered dbt project built on Snowflake demonstrating analytics engineering best practices.

## Stack
- dbt Core 1.11
- Snowflake (free trial)
- SQL

## Project Structure

- **Staging layer** — cleans and renames raw source tables (customers, orders, payments)
- **Mart layer** — joins and aggregates into business-facing datasets including customer lifetime value, order history and payment totals
- **Tests** — column-level uniqueness, not-null and accepted-values tests across all staging models
- **Documentation** — full data lineage and column descriptions generated via dbt docs

## How to run

1. Clone the repo
2. Install dbt: `pip install dbt-snowflake`
3. Configure your `~/.dbt/profiles.yml` with Snowflake credentials
4. `dbt seed` — load raw data
5. `dbt run` — build all models
6. `dbt test` — run data quality tests
7. `dbt docs generate && dbt docs serve` — view lineage and documentation