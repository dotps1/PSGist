Function Set-GistOAuthToken {
    [CmdletBinding(
        ConfirmImpact = 'Medium',
        HelpUri = 'http://dotps1.github.io/PSGist',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [System.String]
    )]

    Param (
        [Parameter(
            HelpMessage = 'Token value to assign the environment variable GIST_OAUTH_TOKEN.',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Token
    )

    Process {
        if ([String]::IsNullOrEmpty($Token)) {
            if ($PSCmdlet.ShouldProcess($Token)) {
                try {
                    $env:GIST_OAUTH_TOKEN = $Token
                    [Environment]::SetEnvironmentVariable('GIST_OAUTH_TOKEN', $Token, 'User')

                    Write-Output -InputObject "OAuth Token Value: $env:GIST_OAUTH_TOKEN"
                } catch {
                    Write-Error -Message $_.ToString() -ErrorAction Stop
                }
            }
        } else {
            New-GistOAuthToken
        }
    }
}
