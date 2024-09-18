FROM node:21-alpine

WORKDIR /app

ADD package.json package-lock.json /app/
RUN npm install

EXPOSE 3000

ADD . /app

# Iniciar un bash interactivo para pruebas
CMD ["/bin/sh"]
