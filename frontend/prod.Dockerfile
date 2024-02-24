# Build stage
FROM node:20-alpine3.19 as build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

COPY /src/config/prod.apiconfig.ts /app/src/config/apiconfig.ts

RUN yarn build

# Prod stage
FROM nginx:alpine as prod

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]