FROM node:24-slim
RUN npm install -g firebase-tools@15.34.1
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
