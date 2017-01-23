FROM node:6.9.4

RUN mkdir -p src/server
WORKDIR src/server

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV
ONBUILD COPY package.json src/server
ONBUILD RUN npm install && npm cache clean
ONBUILD COPY . src/server

CMD [ "npm", "start" ]