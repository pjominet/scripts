:: Name:     convertToZip.cmd
:: Purpose:  convert 7z or rar archives to zip
:: Author:   Patrick Jominet

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

:: variables
SET PATH=%PATH%;D:\Program Files\7-Zip\
SET me=%~n0
SET archive=%~1
FOR %%i IN (%archive%) DO SET extracted=%%~ni
FOR %%i IN (%archive%) DO SET extension=%%~xi

:: main
IF "%~1"=="--help" (
	ECHO %me% [archive to convert]
	@EXIT /B 0
)
IF NOT [%~1]==[] (
	IF EXIST "%archive%" (
		ECHO Now converting: %archive% to zip format...
		ECHO Extracting %extension%-file...
		7z x %archive% -o%extracted% -aoa
		ECHO Recompressing into zip...
		7z a -tzip %extracted%.zip .\%extracted%\* -mx5
		ECHO Removing extracted temporary data...
		@RD /S /Q %extracted%
		ECHO Done!
	) ELSE (
		ECHO %archive% is no archive!
		@EXIT /B 0
	)
) ELSE (
	ECHO Please indicate an archive to convert
	ECHO Or use --help for help
)

:END
ENDLOCAL
ECHO ON
@EXIT /B