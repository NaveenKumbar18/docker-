FROM node:alpine as tiger
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as lion
EXPOSE 80
COPY --from=tiger /var/app/build /usr/share/nginx/html