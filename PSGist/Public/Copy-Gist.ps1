Function Copy-Gist {
    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id
    )

    Process {
        foreach ($item in $Id) {
            $apiCall = @{
                #Body = ''
                RestMethod = 'gists/{0}/forks' -f $item
                Method = 'POST'
            }
    
            [Gist]::new((Invoke-GistApi @apiCall))
        }
    }
}
