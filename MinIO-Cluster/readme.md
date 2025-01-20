# MinIO Cluster Setup with Docker Compose

This project sets up a **MinIO distributed cluster** using Docker Compose. MinIO is a high-performance, S3-compatible object storage system designed for cloud-native environments.

## Features
- Distributed MinIO cluster with multiple nodes.
- S3-compatible object storage.
- Easy-to-setup environment using Docker Compose.


![starrocks pic](../pics/minio-logo.jpg)

## Setup Instructions

- #### 1. Install Docker on your machine
clustering is easier on docker bro

- #### 2. Clone the repository
Clone this repository or create a new directory for your MinIO setup:

- #### 3. Start the Cluster
Run the following command to start the MinIO cluster:
```shell
docker compose up -d
```

- #### 4. Access the web UI interface
search this in your url `localhost:9091`
  - username is in minio_env file `minio_user`
  - password is in minio_env file `minio_password`
