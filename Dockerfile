FROM openjdk:14-alpine
ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone
COPY build/libs/script-memory-leak-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 5000
ENV JAVA_TOOL_OPTIONS "-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.port=5000 \
-Dcom.sun.management.jmxremote.rmi.port=5000 \
-Dcom.sun.management.jmxremote.host=0.0.0.0 \
-Djava.rmi.server.hostname=0.0.0.0"
WORKDIR /
ENTRYPOINT ["java", "-jar", "app.jar"]