Function Copy-Gist {
    [CmdletBinding(
        HelpUri = 'http://dotps1.github.io/PSGist'
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = 'The Id of the Gist Object.',
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
    
            [Gist]::new(
                (Invoke-GistApi @apiCall)
            )
        }
    }
}
