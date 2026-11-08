FROM node:26-alpine as builder
WORKDIR /app
COPY ./package.json .
COPY ./yarn.lock .
RUN node --version && npm --version
RUN yarn install
COPY . .
ARG OMDB_API_KEY
ENV VITE_APP_OMDB_API_KEY=${OMDB_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://www.omdbapi.com/"
RUN yarn build

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
