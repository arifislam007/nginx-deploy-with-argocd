FROM nginx:alpine
RUN rm -rvf /usr/share/nginx/html/index.html
COPY ./*.html /usr/share/nginx/html
