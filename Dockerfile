FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

# Download and install Maven 3
RUN wget -q -O - "https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz" | tar xz -C /opt && \
    ln -s /opt/apache-maven-3.8.5 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin/mvn

# Download and install Java 17
RUN apt-get install -y openjdk-17-jdk

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV MAVEN_HOME=/opt/maven
ENV PATH=${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${PATH}
