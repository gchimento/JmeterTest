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
    Se supero el tiempo de respuesta promedio maximo ("$RT_AVG"): avg-rt>"$RT_AVG"ms, continue as failed 
    Se supero el tiempo maximo del 95 percentil ("$PER95"): p95>"$PER95"ms, continue as failed
    Se supero el tiempo maximo del 95 percentil ("$HITS"): hits>"$HITS", continue as failed
    Se supero el procentaje maximo de errores ("$PERERR"): fail>"$PERERR"%, continue as failed">passfail.yaml; 
else echo "reporting: 
- module: passfail 
  criteria: 
    Se supero el tiempo de respuesta promedio maximo ("$RT_AVG"): avg-rt of $REQ>"$RT_AVG"ms, continue as failed 
    Se supero el tiempo maximo del 95 percentil ("$PER95"): p95 of $REQ>"$PER95"ms, continue as failed
    Se supero el procentaje maximo de errores ("$PERERR"): fail>"$PERERR"%, continue as failed">passfail.yaml; fi
