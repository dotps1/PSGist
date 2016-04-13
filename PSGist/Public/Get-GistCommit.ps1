Function Get-GistCommit {
    [CmdletBinding()]
    [OutputType(
        [GistHistory]
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
                RestMethod = 'gists/{0}/commits' -f $item
                Method = 'GET'
            }
            
            foreach ($result in (Invoke-GistApi @apiCall)) {
                [GistHistory]::new($result)
            }
        }
    }
}
