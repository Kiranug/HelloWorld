@echo off

REM :: TO BE INSTALLED on DEV SERVER (along with C:\AcuTechProdDeploy\remote_prod_deploy.ps1)

IF "%1"=="" (
  echo ERROR: Build version not passed
  exit /b %errorlevel%
)

SET BUILDVERSION=%1

echo "going to run Invoke-Command for webapp1"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File C:\AcuTechProdDeploy\remote_prod_deploy.ps1 "ip-10-1-0-37.ec2.internal" "Administrator" "C:\Users\Administrator\SecureString\webapp1-prod-passwd.txt" %BUILDVERSION%

echo "going to run Invoke-Command for webapp2"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File C:\AcuTechProdDeploy\remote_prod_deploy.ps1 "ip-10-1-0-115.ec2.internal" "Administrator" "C:\Users\Administrator\SecureString\webapp2-prod-passwd.txt" %BUILDVERSION%

echo "going to run Invoke-Command for services1"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File C:\AcuTechProdDeploy\remote_prod_deploy.ps1 "ip-10-1-0-199.ec2.internal" "Administrator" "C:\Users\Administrator\SecureString\services1-prod-passwd.txt" %BUILDVERSION%

echo "going to run Invoke-Command for services2"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File C:\AcuTechProdDeploy\remote_prod_deploy.ps1 "ip-10-1-0-165.ec2.internal" "Administrator" "C:\Users\Administrator\SecureString\services2-prod-passwd.txt" %BUILDVERSION%
