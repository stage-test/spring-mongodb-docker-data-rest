FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
RUN mvn package docker:build
ADD target/spring-mongodb-docker-data-rest-0.1.0.jar app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
