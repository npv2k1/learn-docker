FROM node:14.16.1-alpine3.13

# Working directory be app
WORKDIR /usr/app/frontend

COPY package*.json ./

# Install dependencies
RUN npm install

# copy local files to app folder
COPY . .

EXPOSE 3000

CMD ["npm","start"]