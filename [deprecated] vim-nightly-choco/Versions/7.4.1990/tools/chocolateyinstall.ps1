﻿Install-ChocolateyZipPackage -packageName 'vim-nightly' -UnzipLocation $(Split-Path -Parent $MyInvocation.MyCommand.Definition) -Url64bit 'https://github.com/vim/vim-win32-installer/releases/download/v7.4.1990/gvim_7.4.1990_x64.zip' -Checksum64 'AAC2D5A714E0D6A0925429C683E7704D9C768FDC0C1A05532665A53C1BF5922F' -ChecksumType64 'sha256' -Url 'https://github.com/vim/vim-win32-installer/releases/download/v7.4.1990/gvim_7.4.1990_x86.zip' -Checksum '0570ADF5E3A1F0D147AA57572A6D18DC54C7A0B87D025BED8A2945BCC47786F3' -ChecksumType 'sha256'