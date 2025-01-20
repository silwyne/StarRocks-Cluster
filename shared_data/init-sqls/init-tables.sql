set @s3_endpoint = "http://minio1:9000";
set @s3_access_key = "minio_user";
set @s3_secret_key = "minio_pass";
set @creating_user_name = "test_user";
set @creating_user_pass = "test_1234";

-- creating the user
CREATE ROLE IF NOT EXISTS admin_group;
GRANT ALL PRIVILEGES ON ALL MATERIALIZED VIEWS IN ALL DATABASES TO ROLE 'admin_group';
GRANT ALL PRIVILEGES ON *.* TO ROLE admin_group;
CREATE USER IF NOT EXISTS ${creating_user_name} IDENTIFIED BY ${creating_user_pass} DEFAULT ROLE admin_group ;

-- creating storage volume
CREATE STORAGE VOLUME some_volume
TYPE = S3
LOCATIONS = ("s3://bucket-1/test-dir")
PROPERTIES
(
    "enabled" = "true",
    "aws.s3.endpoint" = @s3_endpoint,
    "aws.s3.access_key" = @s3_access_key,
    "aws.s3.secret_key" = @s3_secret_key,
    "aws.s3.enable_partitioned_prefix" = "false"
);

-- setting it as default
SET some_volume AS DEFAULT STORAGE VOLUME;

-- creating the database
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

-- finally creating the table on minio
CREATE TABLE IF NOT EXISTS test_db.test_table (
name int not NULL COMMENT "name of person",
birthTime DATETIME NULL COMMENT "his birth date",
age int NULL COMMENT "age of that guy"
)
DUPLICATE KEY(name)
PARTITION BY date_trunc('hour', birthTime)
DISTRIBUTED BY HASH(name)
PROPERTIES(
    "storage_volume" = "some_volume",
    "compression" = "ZSTD",
    "datacache.enable" = "true",
    "datacache.partition_duration" = "6 HOUR",
    "partition_live_number" = "6",
    "replication_num" = "1"
);