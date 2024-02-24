#!/bin/bash

cd /home/milan/Documents/Leapfrog/Node/ToDo

# Building all the services
#Database
docker build -t database ./database

#Backend
docker build -t backend ./backend

#Frontend-dev
cp frontend/dev.Dockerfile frontend/Dockerfile
docker build -t frontend-dev ./frontend

#Frontend-prod
cp frontend/prod.Dockerfile frontend/Dockerfile
docker build -t frontend-prod ./frontend

# Creating the network
docker network create database-backend

# Running the services
# Database
docker run --network database-backend --env-file database/.env -e POSTGRES_PASSWORD=testroot -d --name database-container database

# Backend-dev
docker run --network database-backend -d --name backend-container-dev -p 3000:3000 --env-file backend/dev.env backend

# Backend-prod
docker run -d --network database-backend --name backend-container-prod -p 4000:3000 --env-file backend/prod.env backend

# Frontend-dev
docker run -d --name frontend-container-dev -p 5173:5173 frontend-dev

# Frontend-prod
docker run -d --name frontend-container-prod -p 5000:80 frontend-prod