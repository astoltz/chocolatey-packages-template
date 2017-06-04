$ErrorActionPreference = 'Stop';

$packageName= 'redshift-odbc'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/redshift-downloads/drivers/AmazonRedshiftODBC32-1.3.1.1000.msi'
$url64      = 'https://s3.amazonaws.com/redshift-downloads/drivers/AmazonRedshiftODBC64-1.3.1.1000.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'redshift-odbc*'

  checksum      = '1F2F3F314B61B690FECB884973B93E9AA83E55EA3ECFE07FD21295BCF3F11516'
  checksumType  = 'sha256'
  checksum64    = '74F9781A7C1B637A9F0CB174D6E54E2A91601712A0E196BC7CE778CF5B57D9B4'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
