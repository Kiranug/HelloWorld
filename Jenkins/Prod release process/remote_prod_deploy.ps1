[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True)]
   [string]$Hostname,
   [string]$Username,
   [string]$Password,
   [string]$BuildVersion
)

$opt = New-PSSessionOption -SkipCACheck

echo "going to run Invoke-Command for $Hostname"

$winrmuri = "https://" + $Hostname + ":5986/"
$SecurePassword = Get-Content $Password | ConvertTo-SecureString
$cred = New-Object PSCredential -ArgumentList $Username, $SecurePassword
Invoke-Command -SessionOption $opt -ConnectionUri $winrmuri -Credential $cred -ScriptBlock { 
  Param($BuildVersion) & C:\AcuTechDeploy\prod_deploy.bat "$BuildVersion"
} -ArgumentList $BuildVersion
