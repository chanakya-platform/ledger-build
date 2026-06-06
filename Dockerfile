FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src src
RUN mvn clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine
RUN addgroup --system chanakyatech && adduser -S -s /usr/sbin/nologin -G chanakyatech chanakyatech
WORKDIR /opt/chanakya
COPY --from=build /app/target/*.jar app.jar
RUN chown -R chanakyatech:chanakyatech /opt/chanakya
USER chanakyatech
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
