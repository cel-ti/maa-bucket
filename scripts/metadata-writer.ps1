param(
    [Parameter(Mandatory=$true)]
    [string]$SourceMetaFile,

    [Parameter(Mandatory=$true)]
    [string]$TargetDir,

    [string]$OutputFile = "maa-metadata.json"
)

if (-not (Test-Path -Path $SourceMetaFile)) {
    Write-Error "Metadata file not found: $SourceMetaFile"
    exit 1
}

$metadata = Get-Content -Path $SourceMetaFile -Raw | ConvertFrom-Json
$metadata | ConvertTo-Json -Depth 10 | Set-Content -Path (Join-Path -Path $TargetDir -ChildPath $OutputFile) -Encoding UTF8
Write-Host "Wrote metadata to $(Join-Path $TargetDir $OutputFile)"
