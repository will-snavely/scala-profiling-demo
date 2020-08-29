mkdir -p output/analysis
CMD="cd /src"
CMD="$CMD;JAVA_OPTS='-Xmx2G' sbt 'runMain Analyze /app/output/analysis/tree.json'" 
CMD="$CMD;mv *.txt /app/output/analysis"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"
docker-compose run \
	--rm \
	analysis /bin/bash -c "$CMD"
