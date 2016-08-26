Function New-GistOAuthToken {
    [CmdletBinding(
        ConfirmImpact = "Low",
        HelpUri = "http://dotps1.github.io/PSGist/New-GistOAuthToken.html",
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [String]
    )]

    Param (
        [Parameter(
            HelpMessage = "PSCredential object used to autheniticate to GitHub.",
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter(
            HelpMessage = "A Description for the generated Token."
        )]
        [String]
        $TokenDescription = "PSGist PowerShell Module ($env:ComputerName)"
    )
    
    Begin {
        if (-not (Test-Path -Path $env:AppData\PSGist\Private)) {
            try {
                New-Item -Path $env:AppData\PSGist -Name Private -ItemType Directory -ErrorAction Stop | 
                    Out-Null
            } catch {
                throw $_
            }
        }
    }

    Process {
        try {
            $body = @{
                scopes = @(
                    "gist"
                )
                note = "PSGist PowerShell Module Token - $($Credential.UserName)\$env:ComputerName"
            }

            $params = @{
                Uri = "https://api.github.com/authorizations"
                Method = "POST"
                Headers = @{
                    Authorization = "Basic " + [Convert]::ToBase64String(
                        [Text.Encoding]::ASCII.GetBytes("$($Credential.UserName):$($Credential.GetNetworkCredential().Password)")
                    )
                }
                ContentType = "application/json"
                Body = (ConvertTo-Json $body -Compress)
            }

            if ($PSCmdlet.ShouldProcess([String]::Empty, "Create a new Gist OAuth Token?", $PSCmdlet.MyInvocation.InvocationName)) {
                $response = Invoke-RestMethod @params -ErrorAction Stop
                
                New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $($Credential.UserName), (ConvertTo-SecureString -String $response.Token -AsPlainText -Force) | 
                    Export-Clixml -Path $env:AppData\PSGist\Private\OAuthToken.xml -Force |
                        Out-Null
            }

        } catch {
            $message = (ConvertFrom-Json -InputObject $_.ErrorDetails.Message).message
            if ($message -eq "Validation Failed") {
                throw "A token with description '$($body.note)' already exists.  Manually delete the token from https://github.com/settings/tokens."
            } elseif ($null -ne $message) {
                throw $message
            } else {
                throw $_
            }
        } finally {
            # In the early life of this module the OAuth Token was stored it an Environment variable, this is just some clean up now that its serailized to disk.
            if ($null -ne $env:GIST_OAUTH_TOKEN) {
                [Environment]::SetEnvironmentVariable("GIST_OAUTH_TOKEN", $null)
            }
        }
    }
}
