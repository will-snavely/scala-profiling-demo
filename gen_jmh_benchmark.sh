mkdir -p output/trace/jmh
CMD="cd /src/BenchmarkTest"
CMD="$CMD;sbt jmh:run > jmh.txt" 
CMD="$CMD;mv jmh.txt /app/output/trace/jmh/"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"

echo "Generating JMH benchmark (warning: takes a long time, like hours)..."
time docker-compose run \
	--rm \
	benchmark /bin/bash -c "$CMD"
echo "------------------------------"
