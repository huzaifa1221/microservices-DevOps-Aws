FROM node:16.20.2-buster AS builder

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

FROM node:16.20.2-buster-slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

ENTRYPOINT ["npx"]
CMD ["ng", "serve", "--port", "3000", "--host", "0.0.0.0", "--disable-host-check"]
