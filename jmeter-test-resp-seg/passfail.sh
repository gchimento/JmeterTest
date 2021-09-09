#!/bin/bash
RT_AVG=$1
PER95=$2
HITS=$3
PERERR=$4
REQ=$5
if [ -z $REQ ];
then echo "reporting: 
- module: passfail 
  criteria: 
    Se supero el tiempo de respuesta promedio maximo ("$RT_AVG"ms): avg-rt>"$RT_AVG"ms, continue as failed 
    Se supero el tiempo maximo del 95 percentil ("$PER95"ms): p95>"$PER95"ms, continue as failed
    No se llego a la cantidad especificada de requests ("$HITS"): hits<"$HITS", continue as failed
    Se supero el procentaje maximo de errores ("$PERERR"%): fail>"$PERERR"%, continue as failed">passfail.yaml; 
else echo "reporting: 
- module: passfail 
  criteria: 
    Se supero el tiempo de respuesta promedio maximo ("$RT_AVG"ms): avg-rt of $REQ>"$RT_AVG"ms, continue as failed 
    Se supero el tiempo maximo del 95 percentil ("$PER95"ms): p95 of $REQ>"$PER95"ms, continue as failed
    No se llego a la cantidad especificada de requests ("$HITS"): hits of $REQ<"$HITS", continue as failed    
    Se supero el procentaje maximo de errores ("$PERERR"%): fail>"$PERERR"%, continue as failed">passfail.yaml; fi

echo "services:
- module: shellexec
  post-process:
  - "$JMETER_HOME"/bin/jmeter.bat -Jjmeter.save.saveservice.assertion_results_failure_message=false -Jjmeter.reportgenerator.overall_granularity=15000 -Jjmeter.reportgenerator.report_title=%JOB_NAME% -g ${TAURUS_ARTIFACTS_DIR}/kpi.jtl -o ${TAURUS_ARTIFACTS_DIR}/dashboard" >>passfail.yaml