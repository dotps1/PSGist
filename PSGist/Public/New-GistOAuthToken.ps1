Function New-GistOAuthToken {
    [CmdletBinding(
        ConfirmImpact = 'Low',
        HelpUri = 'http://dotps1.github.io/PSGist/New-GistOAuthToken.html',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [String]
    )]

    Param (
        [Parameter(
            HelpMessage = 'PSCredential object used to autheniticate to GitHub.',
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter(
            HelpMessage = 'A Description for the generated Token.'
        )]
        [String]
        $TokenDescription = "PSGist PowerShell Module ($env:ComputerName)"
    )
    
    Process {
        try {
            $body = @{
                scopes = @(
                    'gist'
                )
                note = $TokenDescription
            }

            $params = @{
                Uri = 'https://api.github.com/authorizations'
                Method = 'POST'
                Headers = @{
                    Authorization = 'Basic ' + [Convert]::ToBase64String(
                        [Text.Encoding]::ASCII.GetBytes("$($Credential.UserName):$($Credential.GetNetworkCredential().Password)")
                    )
                }
                ContentType = 'application/json'
                Body = (ConvertTo-Json $body -Compress)
            }

            if ($PSCmdlet.ShouldProcess([String]::Empty, 'Create a new Gist OAuth Token?', $PSCmdlet.MyInvocation.InvocationName)) {
                $response = Invoke-RestMethod @params -ErrorAction Stop

                $env:GIST_OAUTH_TOKEN = $response.Token
                [Environment]::SetEnvironmentVariable('GIST_OAUTH_TOKEN', $response.Token, 'User')

                Write-Output -InputObject "OAuth Token Value: $env:GIST_OAUTH_TOKEN"
            }
        } catch {
            throw (ConvertFrom-Json -InputObject $_.ErrorDetails.Message).message
        }
    }
}
