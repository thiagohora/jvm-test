FROM maven:3.9.9-amazoncorretto-21-al2023 AS build

WORKDIR /opt/test

COPY pom.xml ./
COPY src ./src

ENV MAVEN_OPTS="-Xmx1G -XX:MaxMetaspaceSize=265m"

ARG OPIK_VERSION
RUN mvn versions:set -DnewVersion=latest && \
    mvn clean package -DskipTests

###############################
FROM amazoncorretto:21.0.6-al2023

RUN yum update -y && yum install -y shadow ca-certificates openssl perl \
    && yum clean all


# A Truststore password needs to be configured and passed as build-arg
ARG STORE_PASSWORD=changeit

WORKDIR /opt/test

COPY entrypoint.sh ./

RUN chmod +x ./*.sh

COPY --from=build /opt/test/target/*.jar ./

CMD ["./entrypoint.sh"]
