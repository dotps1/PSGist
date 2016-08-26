Function Get-GistCommit {
    [CmdletBinding(
        HelpUri = "http://dotps1.github.io/PSGist/Get-GistCommit.html"
    )]
    [OutputType(
        [GistHistory]
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
                RestMethod = "gists/{0}/commits" -f $item
                Method = "GET"
            }
            
            foreach ($result in (Invoke-GistApi @apiCall)) {
                [GistHistory]::new(
                    $result
                )
            }
        }
    }
}
