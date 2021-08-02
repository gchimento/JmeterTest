@set JMX=%1
@set DATA=%2
@if not defined DATA (
	@echo execution: >execution.yaml
	@echo - concurrency: {} >>execution.yaml
	@echo   executor: jmeter>>execution.yaml
	@echo   scenario: %JMX%>>execution.yaml
	@echo   throughput: {}>>execution.yaml
	@echo scenarios: >>execution.yaml
	@echo   %JMX%: >>execution.yaml
	@echo     script: %cd%\%JMX%.jmx>>execution.yaml
	@echo     modifications: >>execution.yaml
	@echo       set-prop: >>execution.yaml
	@echo         "Test Plan>TestPlan.serialize_threadgroups": true >>execution.yaml
	
) else (
	@echo execution: >execution.yaml
	@echo - concurrency: {} >>execution.yaml
	@echo   executor: jmeter>>execution.yaml
	@echo   scenario: %JMX%>>execution.yaml
	@echo   throughput: {}>>execution.yaml
	@echo scenarios: >>execution.yaml
	@echo   %JMX%: >>execution.yaml
	@echo     script: %cd%\%JMX%.jmx>>execution.yaml
	@echo     modifications: >>execution.yaml
	@echo       set-prop: >>execution.yaml
	@echo         "Test Plan>TestPlan.serialize_threadgroups": true >>execution.yaml
	@echo     data-sources:>>execution.yaml
	@echo     - path: %cd%\%DATA%.csv>>execution.yaml
)