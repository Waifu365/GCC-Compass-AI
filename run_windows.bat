@echo off
cd /d "%~dp0"
python --version
if errorlevel 1 (echo Install Python 3.10+ from python.org and retry. & pause & exit /b 1)
if not exist .venv python -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install -r requirements.txt
if errorlevel 1 (echo Dependency installation failed. & pause & exit /b 1)
python -m streamlit run app.py
pause
