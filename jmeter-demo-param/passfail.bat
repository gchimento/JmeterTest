@set RT_AVG=%1
@set PER95=%2
@set HITS=%3
@set PERERR=%4
@set REQ=%5
@if not defined REQ (
	@echo reporting: >passfail.yaml
	@echo - module: passfail >>passfail.yaml
	@echo   criteria: >>passfail.yaml
	@echo     Se supero el tiempo de respuesta promedio maximo (%RT_AVG%ms^): avg-rt^>%RT_AVG%ms, continue as failed >>passfail.yaml
	@echo     Se supero el tiempo maximo del 95 percentil (%PER95%ms^): p95^>%PER95%ms, continue as failed >>passfail.yaml
	@echo     No se llego a la cantidad especificada de requests (%HITS%^): hits^<%HITS%, continue as failed >>passfail.yaml
	@echo     Se supero el procentaje maximo de errores (%PERERR%%%^): fail^>%PERERR%%%, continue as failed >>passfail.yaml
) else (
	@echo reporting: >passfail.yaml
	@echo - module: passfail >>passfail.yaml
	@echo   criteria: >>passfail.yaml
	@echo     Se supero el tiempo de respuesta promedio maximo (%RT_AVG%ms^): avg-rt of %REQ%^>%RT_AVG%ms, continue as failed >>passfail.yaml
	@echo     Se supero el tiempo maximo del 95 percentil (%PER95%ms^): p95 of %REQ%^>%PER95%ms, continue as failed >>passfail.yaml
	@echo     No se llego a la cantidad especificada de requests (%HITS%^): hits of %REQ%^<%HITS%, continue as failed >>passfail.yaml
	@echo     Se supero el procentaje maximo de errores (%PERERR%%%^): fail^>%PERERR%%%, continue as failed >>passfail.yaml
)