FROM openjdk:22-jdk-slim

WORKDIR /app

COPY target/app-1.0-SNAPSHOT.jar /app/app.jar

# este entrypoint ejecuta el contenedor y termina
# ENTRYPOINT ["java", "-jar", "/app/app.jar" ]

# este entrypoint mantiene el contenedor vivo despues de mostrar "hola mundo"
ENTRYPOINT ["sh", "-c", "java -jar /app/app.jar && tail -f /dev/null"]

