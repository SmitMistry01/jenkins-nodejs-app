FROM node:alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY . .

EXPOSE 3000
CMD ["npm", "start"]
