FROM node:10.15.3-alpine

# Arguments
ARG DEVELOPER=developer
# Environment Variables
ENV DEVELOPER ${DEVELOPER}

RUN echo "##### Preparing for user => ${DEVELOPER}"

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN addgroup $DEVELOPER \
    && adduser -D -G $DEVELOPER $DEVELOPER

RUN addgroup $DEVELOPER node

ADD ./src /app
ADD ./assets /assets

RUN chown -R $DEVELOPER:$DEVELOPER /app
RUN chown -R $DEVELOPER:$DEVELOPER /assets
RUN chmod +x /assets/entrypoint.sh

USER $DEVELOPER

# Change working directory
WORKDIR /app

# Install dependencies
RUN npm install

# Expose API port to the outside
EXPOSE 7000

ENTRYPOINT ["sh", "/assets/entrypoint.sh"]

CMD ["/bin/sh"]