mkdir -p output/analysis
CMD="cd /src/BytecodeDumpParser"
CMD="$CMD;JAVA_OPTS='-Xmx2G' sbt 'runMain Analyze /app/output/analysis/tree.json \".*foldLeft.*\"'" 
CMD="$CMD;mv *.json /app/output/analysis"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"

echo "Generating call tree analysis..."
time docker-compose run \
	--rm \
	analysis /bin/bash -c "$CMD"
echo "------------------------------"
