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

$projectName = "snapforest"

$devDir = "C:\geodjango\geodjangomapapp\geodjango\" + $projectName + "\"
$webDir = "C:\inetpub\wwwroot\"
$deployDir = $webDir + $projectName + "\"
# deleteIfExist $deployDir


$webConfigPath = $devDir + "web.config"




Copy-Item $devDir $deployDir -Force -Recurse
Copy-Item $webConfigPath $webDir -Force -Recurse
# New-Item $BACKUPFOLDER -ItemType Directory