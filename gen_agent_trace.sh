mkdir -p output/trace/agent
AGENT_JAR="/src/ProfilingAgent/target/ProfilingAgent-1.0-SNAPSHOT-jar-with-dependencies.jar"
CONFIG="/src/agent/agent.json"
CMD="cd /src"
CMD="$CMD;JAVA_OPTS='-javaagent:$AGENT_JAR=$CONFIG'" 
CMD="$CMD /scala-2.13.1/bin/scala -cp $AGENT_JAR:. TestProgram 1000"
CMD="$CMD;cp /src/agent/output/* /app/output/trace/agent"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"
docker-compose run --rm java bash -c "$CMD"
