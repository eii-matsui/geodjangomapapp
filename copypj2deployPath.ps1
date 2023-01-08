Function deleteIfExist($Path) {
    if (Test-Path $Path) {
        Remove-Item $Path -Recurse -Force | Out-Null
    }
}

Function mkdirIfNotExist($Path) {
    if (-Not (Test-Path $Path)) {
        New-Item $Path -ItemType Directory | Out-Null
    }
}


$devDir = "C:\geodjango\geodjangomapapp\geodjango\snapforest"
$deployDir = "C:\inetpub\wwwroot\"
deleteIfExist $deployDir + "snapforest"



Copy-Item $devDir $deployDir -Force -Recurse
# New-Item $BACKUPFOLDER -ItemType Directory