# dbt-tutorial

## Setup

### Install dbt

Using pipenv

```bash
pipenv install
```

Using only pip

```bash
pip install -r requirements.txt
```

### Load Data

```bash
# download data
wget http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_orders.csv -P data/
wget http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/stripe_payments.csv -P data/
wget http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_customers.csv -P data/
# create database and schema
psql -c 'CREATE DATABASE dbt_tutorial;'
psql -d dbt_tutorial -f schema.sql
# load data
CWD="$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"
psql -d dbt_tutorial -c "COPY stripe.stripe_payments(id, orderid, paymentmethod, status, amount, created) FROM '$CWD/data/stripe_payments.csv' DELIMITER ',' CSV HEADER"
psql -d dbt_tutorial -c "COPY jaffle_shop.customers(id, first_name, last_name) FROM '$CWD/data/jaffle_shop_customers.csv' DELIMITER ',' CSV HEADER"
psql -d dbt_tutorial -c "COPY jaffle_shop.orders(id, user_id, order_date, status) FROM '$CWD/data/jaffle_shop_orders.csv' DELIMITER ',' CSV HEADER"
```

## Configure Profile

Add to dbt profiles `~/.dbt/profiles.yml` the database config:

```yaml
dbt_tutorial:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: 
      password: 
      port: 5432
      dbname: dbt_tutorial
      schema: dwh
      threads: 4
```