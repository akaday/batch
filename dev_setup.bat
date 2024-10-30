@echo off
REM Setup script for additional configuration

echo Running setup script...

REM Example: Set additional environment variable
set ADDITIONAL_VAR=example

REM Install Node.js
echo Installing Node.js...
powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://nodejs.org/dist/v14.17.0/node-v14.17.0-x64.msi /quiet /norestart' -Wait"

REM Install Python
echo Installing Python...
powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe /quiet InstallAllUsers=1 PrependPath=1' -Wait"

REM Install project-specific dependencies using npm
echo Installing project-specific dependencies using npm...
npm install

REM Install project-specific dependencies using pip
echo Installing project-specific dependencies using pip...
pip install -r requirements.txt

REM Set up additional environment variables required for the development environment
echo Setting up additional environment variables...
set DEV_ENV_VAR=dev_value

REM Clone or update the project repository
echo Cloning or updating the project repository...
if not exist "project_repo" (
    git clone https://github.com/akaday/batch.git project_repo
) else (
    cd project_repo
    git pull
    cd ..
)

REM Run initial build or compilation steps
echo Running initial build or compilation steps...
cd project_repo
npm run build

echo Setup script complete!
