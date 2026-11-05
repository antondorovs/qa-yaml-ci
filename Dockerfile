FROM node:24-alpine

WORKDIR /workspace
RUN chown node:node /workspace

COPY --chown=node:node package.json package-lock.json ./
RUN npm ci

COPY --chown=node:node . .

USER node

CMD ["npm", "run", "check:ci"]
