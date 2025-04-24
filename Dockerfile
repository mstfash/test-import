FROM node:18-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:18-slim

ENV NODE_ENV=production

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY --from=builder /app/dist ./dist

USER node

EXPOSE 3000

CMD ["npm", "start"]