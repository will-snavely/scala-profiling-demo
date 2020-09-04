mkdir -p output/analysis
CMD="cd /src/BenchmarkTest"
CMD="$CMD;sbt jmh:run" 
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"
docker-compose run \
	--rm \
	benchmark /bin/bash -c "$CMD"
