# StarRocks Cluster Setup on Docker

Welcome to the repository! This project is designed to share knowledge on how to set up a StarRocks Cluster using Docker. The goal is to simplify the process of deploying StarRocks and to provide working examples for enthusiasts and professionals alike.

## About the Project

Currently, this repository demonstrates the setup of a **Shared-Nothing Architecture** StarRocks cluster using Docker Compose. The **Shared-Data Architecture** is planned and will be added in the future.


![starrocks pic](static/starrocks-pic.png)


## Features

- **Docker Compose Configurations**:
    - Pre-configured YAML files to set up Frontend (FE) and Backend (BE) nodes.
    - Includes FE Leader and Follower nodes for proper cluster management.
- **Cluster Architecture**:
    - Shared-Nothing Architecture is implemented, ensuring distributed and independent data storage across nodes.
- **Scalable**:
    - You can easily scale the cluster by adding more nodes.

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
> **Add Backend Nodes** (if required): \
> We execute the following SQL command to add backend nodes to the cluster:
> ```sql
> ALTER SYSTEM ADD BACKEND "StarRocks-03:9050";
> ```
>
> **Add Follower Nodes** (if required):\
> We execute the following SQL command to add follower nodes to the cluster:\
> ```sql
> ALTER SYSTEM ADD FOLLOWER "StarRocks-02:9010";
> ```



### Directory Structure

```
.
├── readme.md                    # Project README file
├── shared_nothing_arch/         # Directory for Shared-Nothing Architecture setup
│   ├── docker-compose.yaml      # Compose file for Shared-Nothing Architecture
│   ├── readme.md                # Architecture-specific README
│   └── volumes/                 # Persistent storage for cluster metadata
│       ├── be/                  # Backend node volume data
│       │   ├── be-conf/         # Configuration for Backend node
│       ├── fe/                  # Frontend leader node volume data
│       │   ├── fe-conf/         # Configuration for Frontend node
│       │   └── init.sql         # Initialization SQL script for Frontend
│       └── fe-2/                # Frontend follower node volume data
│           ├── fe-conf/         # Configuration for Follower Frontend node
```

## Future Plans

- Add configuration for **Shared-Data Architecture**.
- Provide more examples and optimizations for scaling.

## Contact

For any questions or feedback, please reach out to:
- **SMHT**: scaleenor@gmail.com
- [GitHub](https://github.com/Silwyne)

