@set INT=%1
@set LOG=%2
@set PERERR=%3
@set REQ=%4
@echo services: >monitoring.yaml
@echo - local: >>monitoring.yaml
@echo     - interval: %INT%s >>monitoring.yaml
@echo     - logging: %LOG% >>monitoring.yaml
