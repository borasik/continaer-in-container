FROM node:16

WORKDIR /usr/src/app/poc-node-app

COPY . /usr/src/app/poc-node-app

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "nodemon", "server.js" ]
# ENTRYPOINT ["nodemon", "/usr/src/app/poc-node-app/server.js"]