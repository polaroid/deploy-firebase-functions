FROM node:20-slim
RUN npm install -g firebase-tools@13.19.0
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
