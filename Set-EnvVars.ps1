$FileData = Get-Content -Path '.\.env' | Out-String

$ConfigHash = $FileData | ConvertFrom-StringData

foreach ($EnvVarName in $ConfigHash.Keys) {
    Set-Item -Path Env:$EnvVarName -Value $ConfigHash[$EnvVarName]

    Write-Host "Set $EnvVarName" -ForegroundColor Green
}