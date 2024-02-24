#!/bin/bash

# Stopping the services
docker stop database-container backend-container-dev backend-container-prod frontend-container-dev frontend-container-prod

# Removing the containers
docker rm database-container backend-container-dev backend-container-prod frontend-container-dev frontend-container-prod

# Removing the network
docker network rm database-backend