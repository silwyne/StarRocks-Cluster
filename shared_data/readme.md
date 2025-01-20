#  StarRocks-Cluster: shared_data arch

## Explanations
This setup of starrocks is dependent on starrocks and MinIO only :)

>[NOTE!]\
> in this setup MinIO acts as storage layer of the cluster.

we may use this setup for our production environment for its good performance of read and write.

## Cluster nodes info:
- 1 fe-leader node **essential**
- 1 or more cn nodes (compute nodes) **essential**
- 0 or more be nodes **not-essential**
- 0 or more fe-helper (fe-follower) nodes **not-essential**

![shared_data_arch](../pics/shared-data-arch.png)
