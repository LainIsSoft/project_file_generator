@echo off
setlocal enabledelayedexpansion


:: Input file

set input="../Sets/code.txt"
echo %input%

:: Read input file line by line

set pattern="*"
set /a ast = 2

for /f "usebackq tokens=*" %%L in (%input%) do (
	
	
	set line=%%L
			
	echo !line! | findstr /C:"***" >nul
	if not errorlevel 1 (
		
		set /a ast = 2
	) else (
		
		set /a ast = 1
	)
	
	
	if !ast! GEQ 2 (
        
		rem Extract filename between the ***
		
		set "filename=!line:~4,-4!"
		set "outfile=!filename!"	
		
		echo.>!outfile!
		
		echo File created
		
    	) else (
		
		rem Write line to file if inside a section
		if defined outfile (
		
			>>!outfile! echo(!line!
		)
	)
)

echo Done.
pause
