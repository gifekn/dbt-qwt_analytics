import snowflake.snowpark.functions as F 
def model(dbt, session):
    dbt.config(materialized='incremental')
    df=dbt.source("qwt_src","orders")

    if dbt.is_incremental:
        max_from_this=f"select max(orderdate) from {dbt.this}"
        df=df.filter(df.orderdate>=session.sql(max_from_this).collect()[0][0])
    
    return df