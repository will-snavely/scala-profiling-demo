FROM wsnavely/openjdk-debug:latest
ENV JAVA_HOME /opt/jdk-debug
RUN apt-get update && apt-get install -y wget python maven
RUN wget --quiet https://downloads.lightbend.com/scala/2.13.1/scala-2.13.1.tgz \
    && tar -xzf scala-2.13.1.tgz \
    && rm scala-2.13.1.tgz
COPY src/ /src/
RUN cd /src \
    && /scala-2.13.1/bin/scalac TestProgram.scala \
    && cd /src/ProfilingAgent \
    && mvn clean package install
