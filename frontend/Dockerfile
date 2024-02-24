# Build stage
FROM node:20-alpine3.19 as build

WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker caching
COPY package.json yarn.lock ./

RUN yarn

# Copy the rest of the application code
COPY . .

# Build the application
RUN yarn build

# Prod stage
FROM nginx:alpine as prod

# Copy the built application from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]