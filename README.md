### To run individual Dockerfiles manually,
- Create a network for database-backend communication
    ```bash
    docker network create database-backend
    ```

### Database
    ```bash
    cd database
    docker build -t database .
    docker run --network database-backend --env-file .env -e POSTGRES_PASSWORD=testroot --name database-container -d database
    ```

### Backend
- Building the image using the following command:
    ```bash
    cd backend
    docker build -t backend .
    ```
- Running the backend container
    - For dev environment
      ```bash
      docker run --network database-backend --env-file dev.env -p 3000:3000 --name backend-container-dev -d backend
      ```
    - For prod environment
      ```bash
      docker run --network database-backend --env-file prod.env -p 4000:3000 --name backend-container-prod -d backend
      ```  

### Frontend
- For dev environment
    ```bash
    cd frontend
    docker build -t frontend-dev .
    docker run -p 5173:5173 --name frontend-container-dev -d frontend-dev
    ```
- For prod environment
    ```bash
    cd frontend
    docker build -t frontend-prod .
    docker run -p 5000:80 --name frontend-container-prod -d frontend-prod
    ```


## To run the application using custom scripts
- Build and Run
    ```bash
    ./buildandrun.sh
    ```
- Stop and Remove
    ```bash
    ./stopandremove.sh
    ```
- Stop Only
    ```bash
    ./stop.sh
    ```
- Resume
    ```bash
    ./start.sh
    ```

## To run the application using docker-compose
- Build and Run
    ```bash
    docker-compose up -d
    ```
- Stop and Remove
    ```bash
    docker-compose down
    ```
- Stop Only
    ```bash
    docker-compose stop
    ```
- Resume
    ```bash
    docker-compose start
    ```
