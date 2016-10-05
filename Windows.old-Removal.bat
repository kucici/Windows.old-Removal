@echo off
goto check_admin

:check_admin
	echo Checking administrator rights...
	net session >nul 2>&1
	if %errorLevel% == 0 (
		echo Success: Administrator rights confirmed.
	) else (
		echo Failure: No administrator rights.
	)
	
goto delete

:delete
	takeown /F C:\Windows.old\* /R /A
	cacls C:\Windows.old\*.* /T /grant administrators:F
	rmdir /S /Q C:\Windows.old\
	echo Done!
pause
