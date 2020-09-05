rm -rf output
mkdir output
bash gen_bytecode_trace.sh
bash gen_agent_trace.sh
bash gen_jfr_trace.sh
bash gen_calltree.sh
bash gen_call_analysis.sh
bash gen_jmh_benchmark.sh
