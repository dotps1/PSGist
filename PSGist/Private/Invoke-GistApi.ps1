Function Invoke-GistApi {
    [CmdletBinding()]
    
    Param (
        [Parameter(
            Mandatory = $false
        )]
        [HashTable] 
        $Headers = @{ },
        
        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $Method,

        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $RestMethod,

        [Parameter()]
        [String] 
        $Body
    )
    
    if (-not (Test-Path -Path $env:AppData\PSGist\Private\OAuthToken.xml)) {
        New-GistOAuthToken |
            Out-Null
        
        Start-Sleep -Milliseconds 2500
    }

    try {
        $oAuthToken = (Import-Clixml -Path $env:AppData\PSGist\Private\OAuthToken.xml -ErrorAction Stop).GetNetworkCredential().Password 
    } catch {
        Write-Error -Message 'Failed to decrypt OAuth Token.'
        return
    }

    $Headers.Add('Authorization', 'token {0}' -f $oAuthToken)

    $request = @{
        Headers = $Headers
        Uri = 'https://api.github.com/{0}' -f $RestMethod
        Method = $Method
        ErrorAction = 'Stop'
    }
        
    if (-not [String]::IsNullOrEmpty($Body)) { 
        $request.Body = $Body 
    }

    try {
        Invoke-RestMethod @request
    } catch {
        $message = (ConvertFrom-Json -InputObject $_.ErrorDetails.Message).message
        if ($null -ne $message) {
            throw $message
        } else {
            throw $_
        }
    }
}
