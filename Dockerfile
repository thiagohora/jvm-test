FROM maven:3.9.9-amazoncorretto-21-al2023 AS build

WORKDIR /opt/test

COPY pom.xml ./
COPY src ./src

ENV MAVEN_OPTS="-Xmx1G -XX:MaxMetaspaceSize=265m"

ARG OPIK_VERSION
RUN mvn versions:set -DnewVersion=latest && \
    mvn clean package -DskipTests

WORKDIR /opt/test/target

COPY entrypoint.sh ./

RUN chmod +x ./*.sh

CMD ["./entrypoint.sh"]
