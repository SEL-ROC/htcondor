executable = ./job_dagman_final-B-node.pl
output = job_dagman_final-B-nodeC.out
error = job_dagman_final-B-nodeC.err
log = job_dagman_final-B-nodeC.log
arguments = "'FAILED done with C' 1 $(DAG_STATUS)"
universe = scheduler
queue
