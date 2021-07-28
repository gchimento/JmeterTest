#!/bin/bash
RT_AVG=$1
PER95=$2

echo "reporting: 
- module: passfail 
  criteria: 
    Se supero el tiempo de respuesta promedio maximo: avg-rt>"$RT_AVG"ms, continue as failed 
    Se supero el tiempo maximo del 95 percentil: p95>"$PER95"ms, continue as failed">passfail.yaml