# MinIO Cluster Setup with Docker Compose

This project sets up a **MinIO distributed cluster** using Docker Compose. MinIO is a high-performance, S3-compatible object storage system designed for cloud-native environments.

## Features
- Distributed MinIO cluster with multiple nodes.
- S3-compatible object storage.
- Easy-to-setup environment using Docker Compose.


![starrocks pic](../static/minio-logo.jpg)

## Setup Instructions

### 0. Install Docker on your machine

>[!NOTE]\
> clustering is easier on docker bro

### 1. Clone the repository
Clone this repository or create a new directory for your MinIO setup:
```shell
git clone https://github.com/silwyne/StarRocks-Cluster.git
cd StarRocks-Cluster/MinIO-Cluster
```

### 2. Start the Cluster
Run the following command to start the MinIO cluster:
```shell
docker compose up -d
```

### 3. Access the web UI interface
search this in your url `localhost:9091`
    - username is in minio_env file `minio_user`
    - password is in minio_env file `minio_password`
