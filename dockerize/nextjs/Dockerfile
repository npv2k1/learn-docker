FROM node:16.14.2-alpine AS dependencies
RUN apk add --no-cache libc6-compat
RUN npm i -g pnpm@8.2.0

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
RUN pnpm install

FROM dependencies AS builder
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:16.14.2-alpine 
RUN apk add --no-cache libc6-compat
RUN npm i -g pnpm@8.2.0
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.js ./next.config.js
COPY --from=builder /app/next-i18next.config.js ./next-i18next.config.js


EXPOSE 3000
CMD [ "npm", "run", "start" ]