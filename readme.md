# Starrocks Clustering setups

## Explanation
in this repository I have introduced 3 ways to set up starrocks.\
- **standalone**\
which has only one node and does everything you want!
- **shared_nothing**
which has more than one node and is made of fe, be and maybe cn nodes.
- **shared_data**
which uses a third party service for data storage in here `MinIO`


>[!NOTE]\
> we use shared_nothing architecture for our develop and testing environment.\
> we do that because the volume of test data is not that big to force us
> use a shared complicated storage data architecture like `MinIO` or `HDFS`.

you can see the starrocks documentation about its clustering architectures from here:\
[Starrocks-architectures](https://docs.starrocks.io/docs/introduction/Architecture/)

![happy pic](pics/happy.jpg)

### Setup Instructions
for setup instructions of each cluster setup refer to their readme files in their directories.

## Useful tips to know
for more information of how we introduce nodes to fe-leader node (for setting up the cluster) : \
- **Add Backend Nodes** : \
  We execute the following SQL command to add `backend` nodes to the cluster:
```sql
ALTER SYSTEM ADD BACKEND "StarRocks-03:9050";
```
- **Add Follower Nodes** :\
  We execute the following SQL command to add `follower` nodes to the cluster:
```sql
ALTER SYSTEM ADD FOLLOWER "StarRocks-02:9010";
```
- **Add Compute Nodes** :\
  We execute the following SQL command to add `compute` nodes to the cluster:
```sql
ALTER SYSTEM ADD COMPUTE NODE "StarRocks-04:9050";
```