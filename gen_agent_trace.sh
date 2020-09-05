mkdir -p output/trace/agent
AGENT_JAR="/src/ProfilingAgent/Transformer/target/Transformer-1.0-jar-with-dependencies.jar"
RUNTIME_JAR="/src/ProfilingAgent/RuntimeLib/target/RuntimeLib-1.0-jar-with-dependencies.jar"
CONFIG="/src/agent/agent.json"
CMD="cd /src"
CMD="$CMD;JAVA_OPTS='-javaagent:$AGENT_JAR=$CONFIG -Xbootclasspath/a:$RUNTIME_JAR'" 
CMD="$CMD /scala-2.13.1/bin/scala -cp $RUNTIME_JAR:. TestProgram 1000"
CMD="$CMD;cp /src/agent/output/* /app/output/trace/agent"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"

echo "Generating agent trace..."
time docker-compose run --rm java bash -c "$CMD"
echo "------------------------------"
