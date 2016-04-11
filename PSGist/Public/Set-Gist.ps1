Function Set-Gist {

    [CmdletBinding()]

    Param (
    )
    
    $apiCall = @{
        Body = ''
        RestMethod = ''
        Method = ''
    }
    
    Invoke-GistApi @apiCall
}
