FROM nginx:alpine
RUN apk add --no-cache bash
COPY index.html /usr/share/nginx/html
EXPOSE 80
