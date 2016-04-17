Function New-GistOAuthToken {
    [CmdletBinding()]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
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

            $response = Invoke-RestMethod @params -ErrorAction Stop

            $env:GIST_OAUTH_TOKEN = $response.Token
            [Environment]::SetEnvironmentVariable('GIST_OAUTH_TOKEN', $response.Token, 'User')

            Write-Output -InputObject "OAuth Token Value: $env:GIST_OAUTH_TOKEN"
        } catch {
            throw (ConvertFrom-Json -InputObject $_.ErrorDetails.Message).message
        }
    }
}
