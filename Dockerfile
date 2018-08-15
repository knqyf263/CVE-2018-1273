FROM maven:3.5-jdk-8

RUN apt-get update && apt-get install -y vim less
RUN git clone https://github.com/spring-projects/spring-data-examples.git && \
    cd spring-data-examples/ && \
    git checkout 05bc950a46eaa687cb3eaf0489015cea668a5013
WORKDIR spring-data-examples/web/example/
ADD pom.xml ./
RUN mvn clean package

CMD ["java", "-jar", "target/spring-data-web-example-2.0.0.BUILD-SNAPSHOT.jar"]
