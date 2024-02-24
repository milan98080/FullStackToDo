# Use the official Node.js image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if present)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn

# Copy the rest of the application code
COPY . .

# Expose port 3000 by default
EXPOSE 3000

# Build the production application
RUN yarn build

# Set the command to start the application
CMD if [ ${NODE_ENV} = "production" ]; \
    then yarn start:prod; \
    else yarn start:dev; \
    fi
