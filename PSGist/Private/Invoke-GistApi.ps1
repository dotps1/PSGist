Function Invoke-GistApi {
    
    [CmdletBinding()]
    
    Param (
        [Parameter(
            Mandatory = $false
        )]
        [HashTable] 
        $Headers = @{ },
        
        [Parameter(
            Mandatory = $false
        )]
        [String] 
        $Method = 'Get',

        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $RestMethod,

        [Parameter()]
        [String] 
        $Body
    )
    
    if ([String]::IsNullOrEmpty($env:GIST_OAUTH_TOKEN)) {
        Write-Error -Message 'An authorazation token is required to use this function, please run the New-GistOAuthToken function to create a new token, or Set-GistOAuthToken to set the value.' -ErrorAction Stop
    }

    $Headers.Add('Authorization', 'token {0}' -f $env:GIST_OAUTH_TOKEN)

    $request = @{
        Headers = $Headers
        Uri = 'https://api.github.com/{0}' -f $RestMethod
        Method = $Method
        ErrorAction = 'Stop'
    }
    Write-Verbose -Message ('Invoking the REST method: {0}' -f $ApiRequest.Uri)
        
    if (-not [String]::IsNullOrEmpty($Body)) { 
        $request.Body = $Body 
    }

    try {
        Invoke-RestMethod @request
    } catch {
        throw (ConvertFrom-Json -InputObject $_.ErrorDetails.Message).message
    }
}
