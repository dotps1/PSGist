Function Get-GistFork {
    [CmdletBinding(
        HelpUri = "http://dotps1.github.io/PSGist/Get-GistFork.html"
    )]
    [OutputType(
        [GistFork]
    )]

    Param (
        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id
    )

    Process {
        foreach ($item in $Id) {
            $apiCall = @{
                #Body = ""
                RestMethod = "gists/{0}" -f $item
                Method = "GET"
            }
    
            foreach ($result in (Invoke-GistApi @apiCall)) {
                [Gist]::new(
                    $result
                ).Forks
            }
        }
    }
}
