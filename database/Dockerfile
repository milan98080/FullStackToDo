# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Copy the .env file and initialization script into the container
COPY .env /usr/src/app/.env
COPY init.sql /docker-entrypoint-initdb.d/

# Set environment variables
ENV DEV_DB_NAME=${DEV_DB_NAME}
ENV DEV_DB_USER=${DEV_DB_USER}
ENV DEV_DB_PASSWORD=${DEV_DB_PASSWORD}
ENV PROD_DB_NAME=${PROD_DB_NAME}
ENV PROD_DB_USER=${PROD_DB_USER}
ENV PROD_DB_PASSWORD=${PROD_DB_PASSWORD}

# Expose the PostgreSQL port
EXPOSE 5432