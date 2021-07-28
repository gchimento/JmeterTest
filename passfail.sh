#!/bin/bash
RT_AVG=$1
PER95=$2

echo "reporting: 
- module: passfail 
  criteria: 
  - avg-rt>"$RT_AVG"ms, continue as failed 
  - p95>"$PER95"ms, continue as failed">passfail.yaml