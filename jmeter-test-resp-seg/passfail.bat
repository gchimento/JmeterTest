@set PER95=%1
@set HITS=%2
@set PERERR=%3
@set REQ=%4
@if not defined REQ (
	@echo reporting: >passfail.yaml
	@echo - module: passfail >>passfail.yaml
	@echo   criteria: >>passfail.yaml
	echo Se setea el tiempo de percentil 95 maximo en %PER95%ms para el Total
	@echo     Se supero el tiempo maximo del 95 percentil (%PER95%ms^): p95^>%PER95%ms, continue as failed >>passfail.yaml
	echo Se setea el minimo de request en %HITS% para el Total
	@echo     No se llego a la cantidad especificada de requests (%HITS%^): hits^<%HITS%, continue as failed >>passfail.yaml
	echo Se setea el porcentaje maximo de error en %PERERR%%% para el Total
	@echo     Se supero el procentaje maximo de errores (%PERERR%%%^): fail^>%PERERR%%%, continue as failed >>passfail.yaml
) else (
	@echo reporting: >passfail.yaml
	@echo - module: passfail >>passfail.yaml
	@echo   criteria: >>passfail.yaml
	echo Se setea el tiempo de percentil 95 maximo en %PER95%ms para el request %REQ%
	@echo     Se supero el tiempo maximo del 95 percentil (%PER95%ms^): p95 of %REQ%^>%PER95%ms, continue as failed >>passfail.yaml
	echo Se setea el minimo de request en %HITS% para el request %REQ%
	@echo     No se llego a la cantidad especificada de requests (%HITS%^): hits of %REQ%^<%HITS%, continue as failed >>passfail.yaml
	echo Se setea el porcentaje maximo de error en %PERERR%%% para el Total
	@echo     Se supero el procentaje maximo de errores (%PERERR%%%^): fail^>%PERERR%%%, continue as failed >>passfail.yaml
)
@echo services: >>passfail.yaml
@echo - module: shellexec >>passfail.yaml
@echo   post-process: >>passfail.yaml
@echo   - %JMETER-HOME%\bin\jmeter.bat -Jjmeter.save.saveservice.assertion_results_failure_message=false -g ${TAURUS_ARTIFACTS_DIR}\kpi.jtl -o ${TAURUS_ARTIFACTS_DIR}\dashboard >>passfail.yaml