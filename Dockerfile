FROM openjdk:17
WORKDIR /app
COPY . .
RUN javac Hello.java
CMD ["java", "Hello"]
