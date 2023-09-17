#  Dockerfile for Node Express Backend api (development)

FROM node:alpine

ARG NODE_ENV=development

# Create App Directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install Dependencies
COPY package*.json ./
RUN npm install

# Copy app source code
# COPY . .


# Exports

# CMD ["npm","start"]
