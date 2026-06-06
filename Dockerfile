FROM eclipse-temurin:17.0.6_10-jre-alpine
RUN addgroup --system chanakyatech  && adduser -S -s /usr/sbin/nologin -G chanakyatech chanakyatech && mkdir -p /opt/chanakya
WORKDIR /opt/chanakya
COPY target/chanakyatech-springboot-mysql-97397*****.jar app.jar
COPY startup.sh startup.sh
RUN chown -R chanakyatech:chanakyatech /opt/chanakya
USER chanakyatech
EXPOSE 8080
ENTRYPOINT ["./startup.sh"]
