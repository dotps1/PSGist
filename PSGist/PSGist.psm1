#region ProviderPath

$paths = @(
    "Private",
    "Public"
)

foreach ($path in $paths) {
    "$(Split-Path -Path $MyInvocation.MyCommand.Path)\$path\*.ps1" | 
        Resolve-Path | 
            ForEach-Object { 
	            . $_.ProviderPath
            }
}

#endregion ProviderPath


#region Aliases

New-Alias -Name "Fork-Gist" -Value "Copy-Gist"

#endregion Aliases


#region PSDrives

if (-not (Test-Path -Path Gists:\)) {
    if (-not (Test-Path -Path $env:APPDATA\PSGist)) {
        New-Item -Path "$env:APPDATA\PSGist" -ItemType Directory
    }

    New-PSDrive -Name "Gists" -PSProvider FileSystem -Root "$env:APPDATA\PSGist" -Scope 1
}

#endregion PSDrives
