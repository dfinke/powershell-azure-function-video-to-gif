# https://github.com/krishnaji/durable-function-video-to-gif
# https://stackoverflow.com/questions/21242868/using-ffmpeg-with-powershell

param([byte[]] $InputBlob, $TriggerMetadata)

Write-Host "PowerShell Blob trigger function Processed blob! Name: $($TriggerMetadata.Name) Size: $($InputBlob.Length) bytes"

$ffmpeg = "$PSScriptRoot\..\ffmpeg\ffmpeg-4.1.3-win64-static\bin\ffmpeg.exe"
$basePath = "d:\home\site\videos"

if (!(Test-Path $basePath)) {
    $null = mkdir $basePath
}

$fileName = $TriggerMetadata.Name
$fullName = $basePath + "\" + $fileName

[System.IO.File]::WriteAllBytes($fullName, $InputBlob)

#$newVideo = [System.IO.Path]::ChangeExtension($fullName, '.flv')
#$ArgumentList = '-i "{0}" -y -async 1 -b 2000k -ar 44100 -ac 2 -v 0 -f flv -vcodec libx264 -preset superfast "{1}"' -f $fullName, $newVideo

$newVideo = [System.IO.Path]::ChangeExtension($fullName, '.gif')
$ArgumentList = '-i "{0}" -vf fps=12,scale=854:-1 -f gif "{1}"' -f $fullName, $newVideo

Start-Process -FilePath $ffmpeg -ArgumentList $ArgumentList -Wait -NoNewWindow