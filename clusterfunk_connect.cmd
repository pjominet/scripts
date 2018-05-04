:: Name:     clusterfunk_connect.cmd
:: Purpose:  connection to clusterfunk.tech
:: Author:   Patrick Jominet

@ECHO OFF

ssh -q -p 54545 -D 7777 shominees@clusterfunk.tech

:END
ECHO ON
@EXIT /B
