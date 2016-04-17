#region ProviderPath

$paths = @(
    'Private',
    'Public'
)

foreach ($path in $paths) {
    "$(Split-Path -Path $MyInvocation.MyCommand.Path)\$path\*.ps1" | Resolve-Path | ForEach-Object { 
	    . $_.ProviderPath 
    }
}

#endregion ProviderPath


#region Aliases

New-Alias -Name 'Fork-Gist' -Value 'Copy-Gist'

#endregion Aliases