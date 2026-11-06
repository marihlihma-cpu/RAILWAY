FROM alpine:3.20
RUN apk add --no-cache tinyproxy
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 8888
CMD ["/start.sh"]
