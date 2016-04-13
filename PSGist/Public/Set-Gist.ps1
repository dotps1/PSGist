Function Set-Gist {
    [CmdletBinding()]
    [OutputType()]
    
    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id,

        [Parameter(
            Mandatory = $true
        )]
        [Bool]
        $Star
    )

    Process {
        foreach ($item in $Id) {
            $restMethod = 'gists/{0}/star' -f $item
                
            if ($Star -eq $true) {
                $method = 'PUT'
            } else {
                $method = 'DELETE' 
            }

            $apiCall = @{
                #Body = ''
                RestMethod = $restMethod
                Method = $method
            }
            
            Invoke-GistApi @apiCall
        }
    }
}
