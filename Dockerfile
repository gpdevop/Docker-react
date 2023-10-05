from node:alpine as builder
workdir '/app'
Copy package.json .
run npm install
Copy . .
run npm run build

from nginx:latest
copy --from=builder /app/build /usr/share/nginx/html
volumes:
    - "/etc/timezone:/etc/timezone:ro"
    - "/etc/localtime:/etc/localtime:ro"