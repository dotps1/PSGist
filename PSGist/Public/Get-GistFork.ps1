Function Get-GistFork {

    [CmdletBinding()]
    [OutputType(
        [GistFork]
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
                Method = 'GET'
            }
    
            foreach ($result in (Invoke-GistApi @apiCall)) {
                [GistFork]::new(
                    $result
                )
            }
        }
    }
}
