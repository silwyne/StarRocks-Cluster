CREATE ROLE IF NOT EXISTS test_role;
CREATE USER IF NOT EXISTS 'test_user' IDENTIFIED BY 'test_pass' DEFAULT ROLE test_role ;
GRANT ALL PRIVILEGES ON *.* TO ROLE test_role;

CREATE DATABASE test_db;

CREATE TABLE test_db.test_table (id INTEGER, name STRING) ;