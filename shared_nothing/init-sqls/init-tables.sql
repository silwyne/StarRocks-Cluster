set @creating_user_name = "test_user";
set @creating_user_pass = "test_1234";


CREATE DATABASE IF NOT EXISTS test_db;

CREATE ROLE IF NOT EXISTS admin_group;
GRANT ALL PRIVILEGES ON ALL MATERIALIZED VIEWS IN ALL DATABASES TO ROLE 'admin_group';
GRANT ALL PRIVILEGES ON *.* TO ROLE admin_group;

CREATE USER IF NOT EXISTS @creating_user_name IDENTIFIED BY @creating_user_pass DEFAULT ROLE admin_group ;

USE test_db;

CREATE TABLE IF NOT EXISTS test_db.test_table (
name int not NULL COMMENT "",
birthTime DATETIME NULL COMMENT "",
age int NULL COMMENT "",
)
DUPLICATE KEY(name)
PARTITION BY date_trunc('hour', birthTime)
DISTRIBUTED BY HASH(name)
PROPERTIES(
    "compression" = "ZSTD",
    "partition_live_number" = "3",
    "replication_num" = "1"
);