:: Name:     ziphw.cmd
:: Purpose:  Zips homework files excluding IDE specific ones
:: Author:   Patrick Jominet

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

:: variables
SET me=%~n0
SET mydate=20%date:~10,2%-%date:~7,2%-%date:~4,2%
SET pathToFolder=%~1
SET folderName=%pathToFolder:~0,-1%
SET archive=%folderName%_%mydate%_Jominet_5756626.zip

:: main
IF "%pathToFolder%"=="--help" (
	ECHO %me% [path/to/folder/]
	@EXIT /B 0
)
IF NOT [%~1]==[] (
	IF EXIST "%pathToFolder%" (
		ECHO Now zipping: %folderName%
		7z a -tzip %archive% %pathToFolder% -mx5 -xr!.idea -xr!cmake-build-* -xr!.git -xr!.gitignore -xr!*.md -xr!bin -xr!*.user -xr!*.iml -xr!out
	) ELSE (
		ECHO %pathToFolder% is no folder!
		@EXIT /B 0
	)
) ELSE (
	ECHO Please indicate a folder to be zipped
	ECHO Or use --help for help
)

:END
ENDLOCAL
ECHO ON
@EXIT /B 