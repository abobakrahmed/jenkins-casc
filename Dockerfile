FROM alpine:latest
RUN apk add --no-cache maven
RUN  adduser -D javauser
COPY --chown=javauser:javauser ./* /app
WORKDIR app
#RUN sudo chown -R javauser:javauser /app
USER javauser
RUN pwd
RUN mvn package
CMD ["mvn", "spring-boot:run"]
