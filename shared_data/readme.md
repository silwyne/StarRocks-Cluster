#  StarRocks-Cluster: shared_data arch

## Explanations
This setup of starrocks is dependent on starrocks and MinIO only :)

>[NOTE!]\
> in this setup MinIO acts as storage layer of the cluster.

we may use this setup for our production environment for its good performance of read and write.

## Cluster nodes info:
- 1 `fe-leader` node **essential**
- 1 or more cn nodes (compute nodes) **essential**
- 1 or more `MinIO` nodes **essential**
- 0 or more `be` nodes **not-essential**
- 0 or more `fe-helper` (fe-follower) nodes **not-essential**

![shared_data_arch](../pics/shared-data-arch.png)

## Configuration
the main question in this setup is
how we configure starrocks to use `MinIO`?\
The answer is that we put these configurations in fe.conf of the fe-leader node.
```text
run_mode = shared_data
cloud_native_storage_type = S3
aws_s3_endpoint = minio1:9000
aws_s3_path = bucket-1
aws_s3_path = bucket-2
aws_s3_path = bucket-3

aws_s3_access_key = minio_user
aws_s3_secret_key = minio_pass
aws_s3_use_instance_profile = false
aws_s3_use_aws_sdk_default_behavior = false

tablet_create_timeout_second=180
statistic_collect_query_timeout=10000
```