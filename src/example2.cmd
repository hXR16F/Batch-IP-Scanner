@echo off
cls

for %%n in (
	"Example #2:"
	"Searching for devices in your LAN network with 2 threads and 1000ms timeout."
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
	BatchIPScanner.bat -in 192.168.0.1 192.168.1.255 2 1000
	for /L %%n in (0,0,1) do pause > nul
	
:2
	for %%n in (
		"192.168.0.1"
		"192.168.1.255"
		"2"
		"1000"
	) do echo;%%~n>> "BatchIPScanner.cfg"
	start BatchIPScanner.bat
	exit
	