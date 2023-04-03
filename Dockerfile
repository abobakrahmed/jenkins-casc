FROM alpine:latest
RUN apk add --no-cache maven
RUN  adduser -D javauser
COPY --chown=javauser:javauser . /app
WORKDIR app
USER javauser
#RUN echo "$PWD"
RUN mvn package
CMD ["mvn", "spring-boot:run"]
