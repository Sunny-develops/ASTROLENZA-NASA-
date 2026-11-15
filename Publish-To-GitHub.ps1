[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$ZipPath = (Join-Path $PSScriptRoot 'ASTROLENZA_GitHub_Release.zip'),
    [Parameter(Mandatory = $false)]
    [string]$RepositoryPath = (Join-Path $HOME 'source\ASTROLENZA-NASA-')
)

$ErrorActionPreference = 'Stop'
$repositoryUrl = 'https://github.com/Sunny-develops/ASTROLENZA-NASA-.git'
$repositoryName = 'ASTROLENZA-NASA-'
$tempPath = Join-Path ([System.IO.Path]::GetTempPath()) ("astrolenza-import-" + [guid]::NewGuid().ToString('N'))

function Invoke-Git {
    param([string[]]$GitArgs)
    & git @GitArgs
    if ($LASTEXITCODE -ne 0) {
        throw "Git command failed (exit $LASTEXITCODE): git $($GitArgs -join ' ')"
    }
}

try {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw 'Git for Windows is not installed. Install it from https://git-scm.com/download/win and rerun this script.'
    }
    if (-not (Test-Path -LiteralPath $ZipPath -PathType Leaf)) {
        throw "Release ZIP not found: $ZipPath"
    }

    New-Item -ItemType Directory -Path $tempPath -Force | Out-Null
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $tempPath -Force
    $sourceRoot = Join-Path $tempPath 'ASTROLENZA_GitHub_Release'
    if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot 'README.md') -PathType Leaf)) {
        throw 'The ZIP does not contain the expected ASTROLENZA_GitHub_Release/README.md package root.'
    }

    # Verify every packaged file before touching the destination clone.
    $manifestPath = Join-Path $sourceRoot 'MANIFEST.sha256'
    if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
        throw 'MANIFEST.sha256 is missing from the release package.'
    }
    foreach ($line in Get-Content -LiteralPath $manifestPath) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if ($line -notmatch '^(?<hash>[0-9a-fA-F]{64})\s+\./(?<relative>.+)$') {
            throw "Invalid checksum manifest line: $line"
        }
        $candidate = Join-Path $sourceRoot $Matches.relative
        if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
            throw "Manifest file is missing: $($Matches.relative)"
        }
        $actual = (Get-FileHash -LiteralPath $candidate -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actual -ne $Matches.hash.ToLowerInvariant()) {
            throw "Checksum mismatch: $($Matches.relative)"
        }
    }

    $requiredFiles = @(
        '02_Final_Visor_Prototype/ASTROLENZA_Visor_v19.html',
        '01_Submission_Demo/ASTROLENZA_Mission_Intelligence_Briefing_v19.html',
        '01_Submission_Demo/ASTROLENZA_Mission_Intelligence_Briefing_v19.pdf',
        '.github/workflows/pages.yml'
    )
    foreach ($relative in $requiredFiles) {
        if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot $relative) -PathType Leaf)) {
            throw "Required release asset is missing: $relative"
        }
    }

    if (Test-Path -LiteralPath $RepositoryPath) {
        if (-not (Test-Path -LiteralPath (Join-Path $RepositoryPath '.git') -PathType Container)) {
            throw "Destination exists but is not a Git clone: $RepositoryPath. Choose another -RepositoryPath or move that folder first."
        }
        $dirty = & git -C $RepositoryPath status --porcelain
        if ($LASTEXITCODE -ne 0) { throw 'Could not inspect the existing Git working tree.' }
        if ($dirty) { throw "The existing repository has uncommitted changes. Commit or stash them first: $RepositoryPath" }
        Invoke-Git @('-C', $RepositoryPath, 'checkout', 'main')
        Invoke-Git @('-C', $RepositoryPath, 'pull', '--ff-only', 'origin', 'main')
    }
    else {
        $parent = Split-Path -Parent $RepositoryPath
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
        Invoke-Git @('clone', $repositoryUrl, $RepositoryPath)
        Invoke-Git @('-C', $RepositoryPath, 'checkout', 'main')
    }

    # Copy release contents into the clone while preserving its .git directory.
    Get-ChildItem -LiteralPath $sourceRoot -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $RepositoryPath -Recurse -Force
    }

    Invoke-Git @('-C', $RepositoryPath, 'add', '--all')
    Invoke-Git @('-C', $RepositoryPath, 'diff', '--cached', '--check')
    $staged = & git -C $RepositoryPath diff --cached --stat
    if ($LASTEXITCODE -ne 0) { throw 'Could not inspect staged changes.' }
    if (-not $staged) {
        Write-Host 'The repository already matches the supplied release package.' -ForegroundColor Green
    }
    else {
        Write-Host ''
        Write-Host 'Staged release changes:' -ForegroundColor Cyan
        Write-Host $staged
        Invoke-Git @('-C', $RepositoryPath, 'commit', '-m', 'release: publish ASTROLENZA v19 complete project')
        Invoke-Git @('-C', $RepositoryPath, 'push', 'origin', 'main')
    }

    Write-Host ''
    Write-Host "ASTROLENZA v19 repository is up to date: https://github.com/Sunny-develops/$repositoryName" -ForegroundColor Green
    Write-Host "Local repository: $RepositoryPath"
    Write-Host 'Next: enable GitHub Pages under Settings > Pages > Build and deployment > GitHub Actions.'
}
catch {
    Write-Error $_
    exit 1
}
finally {
    if (Test-Path -LiteralPath $tempPath) {
        Remove-Item -LiteralPath $tempPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}
