FROM java:8
WORKDIR /
ADD ./target/spring-security-good-0.0.1-SNAPSHOT.jar spring-security-good-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD java -jar spring-security-good-0.0.1-SNAPSHOT.jar
