@echo off
setlocal

set UPSTREAM=dodorz/scoop-bucket:master
for /f %%i in ('scoop which scoop') do set AUTOPR=%%~dpiauto-pr.ps1
for /f %%i in ('scoop which pwsh') do set PWSH=%%i
if "%PWSH%x" == "x" for /f %%i in ('scoop which powershell') do set PWSH=%%i

for %%i in (%0) do set DIR=%%~dpi..

%PWSH% -noprofile -ex unrestricted -f %AUTOPR% -dir %DIR% -upstream %UPSTREAM%  -p 
