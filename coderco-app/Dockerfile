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
