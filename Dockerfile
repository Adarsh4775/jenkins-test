FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN javac Hello.java
CMD ["java", "Hello"]
