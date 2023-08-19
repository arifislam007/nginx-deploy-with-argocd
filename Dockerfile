ARG BUILD_NUMBER
LABEL build_number=${BUILD_NUMBER}
FROM nginx:alpine
RUN rm -rvf /usr/share/nginx/html/index.html
COPY ./*.html /usr/share/nginx/html
