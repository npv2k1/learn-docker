# Nestjs Dockerize

Để đóng gói nestjs ta có thể sử dụng `Dockerfile` như sau:

`Dockerfile`

```Dockerfile
FROM node:16.14.2-alpine AS builder
RUN apk add --no-cache libc6-compat
RUN npm i -g pnpm@8.2.0

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
COPY prisma ./prisma/
RUN pnpm install

COPY . .
RUN npm run build

FROM node:16.14.2-alpine
RUN apk add --no-cache libc6-compat
RUN npm i -g pnpm@8.2.0
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public
COPY --from=builder /app/templates ./templates


EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]
```

File `Dockerfile` trên gồm 2 stage build. State ban đầu dùng để cài package. Statge thử 2 để build và chạy.
