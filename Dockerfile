FROM node:latest
RUN mkdir -p /usr/src/client
WORKDIR /usr/src/client
COPY client/package.json /usr/src/client
RUN npm install
COPY client/. /usr/src/client
RUN npm run build

RUN mkdir -p /usr/src/server
WORKDIR /usr/src/server
COPY server/package.json /usr/src/server
RUN npm install
COPY server/. /usr/src/server
EXPOSE 5000
CMD npm run start
