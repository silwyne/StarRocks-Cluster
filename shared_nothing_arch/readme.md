#  StarRocks-Cluster: shared_nothing arch

## Cluster nodes info:
- 1 fe-leader node
- 1 or more be nodes
- 0 or more fe-helper (fe-follower) nodes

## Getting Started

### Prerequisites

- Install Docker and Docker Compose on your machine.
- Clone this repository:
  ```bash
  git clone https://github.com/silwyne/StarRocks-Cluster
  cd starrocks-cluster-docker
  ```

### Setup Instructions

1. **Start the Cluster**:
   Run the following command to bring up the cluster:
   ```bash
   docker compose up -d
   ```

2. **Check Logs**:
   Verify that all services are running properly:
   ```bash
   docker compose logs --follow
   ```

3. **Connect to the Cluster**:
   Use the SQL shell to connect to the FE node:
   ```bash
   mysql -h 127.0.0.1 -P 9030 -u root
   ```

4.
> [!TIP] \
> for more information of how we introduce nodes to fe-leader node (for setting up the cluster) : \
> **Add Backend Nodes** : \
> We execute the following SQL command to add backend nodes to the cluster:
> ```sql
> ALTER SYSTEM ADD BACKEND "StarRocks-03:9050";
> ```
>
> **Add Follower Nodes** :\
> We execute the following SQL command to add follower nodes to the cluster:\
> ```sql
> ALTER SYSTEM ADD FOLLOWER "StarRocks-02:9010";
> ```