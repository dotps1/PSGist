Function Set-GistOAuthToken {
    [CmdletBinding()]
    [OutputType(
        [System.String]
    )]

    Param (
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Token
    )

    Process {
        if ([String]::IsNullOrEmpty($Token)) {
            try {
                $env:GIST_OAUTH_TOKEN = $Token
                [Environment]::SetEnvironmentVariable('GIST_OAUTH_TOKEN', $Token, 'User')

                Write-Output -InputObject "OAuth Token Value: $env:GIST_OAUTH_TOKEN"
            } catch {
                Write-Error -Message $_.ToString() -ErrorAction Stop
            }
        } else {
            New-GistOAuthToken
        }
    }
}
