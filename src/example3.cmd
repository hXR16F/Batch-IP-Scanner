@echo off
cls

for %%n in (
	"Example #3:"
	"Scanning some Google servers with 10 threads and 700ms timeout."
	"Sometimes it gets really slow when called directly from *.bat file."
) do echo;%%~n
echo.

for %%n in (
	"Select method:"
	""
	"  1) Just calling from this file (slow and buggy)"
	"  2) Creating config file to avoid bugs (faster)"
	""
) do echo;%%~n

set /P "choice=> "
if "%choice%" EQU "1" (
	goto 1
) else (
	if "%choice%" EQU "2" (
		goto 2
	) else (
		exit
	)
)

:1
	BatchIPScanner.bat -in 216.58.208.1 216.58.208.15 10 700
	for /L %%n in (0,0,1) do pause > nul
	
:2
	for %%n in (
		"216.58.208.1"
		"216.58.208.15"
		"10"
		"700"
	) do echo;%%~n>> "BatchIPScanner.cfg"
	start BatchIPScanner.bat
	exit
	