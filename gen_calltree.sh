mkdir -p output/analysis
CMD="cd /src/BytecodeDumpParser"
CMD="$CMD;JAVA_OPTS='-Xmx2G' sbt 'runMain BuildTree /app/output/trace/bytecode/bytecode.txt tree.json'"
CMD="$CMD;mv tree.json /app/output/analysis"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"

echo "Generating call tree..."
time docker-compose run \
	--rm \
	analysis /bin/bash -c "$CMD"
echo "------------------------------"
