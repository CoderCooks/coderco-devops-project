#Dockerfile for CoderCo App
#This Dockerfile is used to build a Docker image for the CoderCo application.

#First stage

FROM node:23-alpine3.20 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev && npm cache clean --force

COPY . . 

#Second Stage
FROM node:23-alpine3.20 AS runner

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]
