@echo off
setlocal
cd /d "%~dp0"
where python >nul 2>nul
if %errorlevel%==0 (
  echo Starting FocusPod at http://localhost:8765
  start "FocusPod" http://localhost:8765
  python -m http.server 8765
  goto :end
)
where py >nul 2>nul
if %errorlevel%==0 (
  echo Starting FocusPod at http://localhost:8765
  start "FocusPod" http://localhost:8765
  py -m http.server 8765
  goto :end
)
echo Python was not found. Opening FocusPod directly in your default browser.
start "" "%~dp0index.html"
echo Some features may work more reliably when served locally.
pause
:end
endlocal
