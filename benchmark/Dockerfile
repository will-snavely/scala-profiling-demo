FROM mozilla/sbt:latest
COPY /src /src
WORKDIR /src/BenchmarkTest
RUN sbt jmh:compile
