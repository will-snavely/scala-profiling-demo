mkdir -p output/trace/bytecode
CMD="cd /src/"
CMD="$CMD;JAVA_OPTS='-XX:+TraceBytecodes' /scala-2.13.1/bin/scala TestProgram 1000" 
CMD="$CMD | python /app/java/src/filter_trace.py > bytecode.txt"
CMD="$CMD;mv bytecode.txt /app/output/trace/bytecode"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output/trace/bytecode"
docker-compose run \
	--rm \
	java /bin/bash -c "$CMD"
