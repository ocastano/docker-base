FROM alpine:3.9.2

# Arguments
ARG DEVELOPER=developer
# Environment Variables
ENV DEVELOPER ${DEVELOPER}

RUN echo "##### Preparing for user => ${DEVELOPER}"

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN addgroup $DEVELOPER \
    && adduser -D -G $DEVELOPER $DEVELOPER


ADD ./src /app
ADD ./assets /assets

RUN chown $DEVELOPER:$DEVELOPER -R /app
RUN chown $DEVELOPER:$DEVELOPER -R /assets
RUN chmod +x /assets/entrypoint.sh

USER $DEVELOPER

ENTRYPOINT ["sh", "/assets/entrypoint.sh"]

CMD ["/bin/sh"]