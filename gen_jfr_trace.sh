mkdir -p output/trace/jfr
CMD="cd /src"
CMD="$CMD;JAVA_OPTS='-XX:StartFlightRecording=disk=true,dumponexit=true,filename=recording.jfr,maxsize=1024m,maxage=1d,settings=profile'"
CMD="$CMD /scala-2.13.1/bin/scala TestProgram 1000" 
CMD="$CMD;mv *.jfr /app/output/trace/jfr"
CMD="$CMD;chown -R $(id -u):$(id -g) /app/output"

echo "Generating Java-Flight-Recorder trace..."
time docker-compose run \
	--rm \
	java /bin/bash -c "$CMD"
echo "------------------------------"
