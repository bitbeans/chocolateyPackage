﻿$ErrorActionPreference = 'Stop'
 
 
$packageName= 'anaconda3'
$url        = 'http://repo.continuum.io/archive/Anaconda3-5.0.0-Windows-x86.exe'
$url64      = 'http://repo.continuum.io/archive/Anaconda3-5.0.0-Windows-x86_64.exe'
$ToolsDir   = Get-ToolsLocation


$pp = Get-PackageParameters

if (!$pp['InstallationType']) {
    $InstallationType = 'AllUsers'
} else {
    if ($pp['InstallationType'] -notin 'AllUsers','JustMe') {
        Write-Error "Value for InstallationType not recognised: only `'AllUsers`' or `'JustMe`' are valid"
    } else {
        $InstallationType = $pp['InstallationType']
    }
}

if (!$pp['RegisterPython']) {
    $RegisterPython = '1'
} else {
    if ($pp['RegisterPython'] -notin '0','1') {
        Write-Error "Value for RegisterPython not recognised: only `'0`' or `'1`' are valid"
    } else {
        $RegisterPython = $pp['RegisterPython']
    }
}

if (!$pp['AddToPath']) {
    $AddToPath = '0'
} else {
    if ($pp['AddToPath'] -notin '0','1') {
        Write-Error "Value for AddToPath not recognised: only `'0`' or `'1`' are valid"
    } else {
        $AddToPath = $pp['AddToPath']
    }
}

if (!$pp['D']) {
    $D = Join-Path $ToolsDir 'Anaconda3'
} else {
    if (!(Test-Path -IsValid $pp['D'])) {
        Write-Error "Value for D ($($pp['D'])) is not a valid directory path"
    } else {
        $D = $pp['D']
    }
}
 
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
 
  silentArgs    = "/S /InstallationType=$InstallationType /RegisterPython=$RegisterPython /AddToPath=$AddToPath /D=$D"
  validExitCodes= @(0)
 
  softwareName  = 'Anaconda3'
  checksum      = 'a0d5d8e328b1d3a1ed921cadeecda659c49b6042980558f5c5f491e884bf842a'
  checksumType  = 'sha256'
  checksum64    = '53bd80727099b5767b9f20f99e908f9c19cea7572c14f9538dc1c8ca7ab5e742'
  checksumType64= 'sha256'
}
 
Write-Warning 'installing anaconda3, this can take a long time, because the installer will write tons of files on your disk'
Write-Warning 'Please sit back and relax'
Write-Warning 'This usually will take 10-15 mins on an SSD, and about 30 mins on HDD'
Write-Warning ''
Write-Warning 'If you want to make sure the program is running, you can open Task Manager'
Write-Warning 'you will find the installer running in Background Process'
Install-ChocolateyPackage @packageArgs
