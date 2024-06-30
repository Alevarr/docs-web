FROM node:20.15.0-alpine3.19

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app

COPY package*.json .

RUN yarn install

COPY . .

EXPOSE 3000

RUN ["yarn", "build"]

CMD ["yarn", "serve"]
