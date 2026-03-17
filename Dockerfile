FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .
RUN javac Hello.java
CMD ["java", "Hello"]
