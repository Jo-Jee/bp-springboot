FROM amazoncorretto:17-alpine AS builder
COPY . .

RUN ./gradlew bootJar

FROM amazoncorretto:17-alpine

ENV TZ=Asia/Seoul

COPY --from=builder build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
