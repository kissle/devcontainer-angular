FROM node:lts-alpine
ENV NODE_ENV=development
WORKDIR /usr/src/app

RUN apk update \
    && apk add git

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --development --silent && mv node_modules ../
COPY . .
# EXPOSE 4200
RUN chown -R node /usr/src/app
USER node
CMD cd ./frontend && npm start

