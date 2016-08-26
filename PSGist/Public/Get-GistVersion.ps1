Function Get-GistVersion {
    [CmdletBinding(
        HelpUri = "http://dotps1.github.io/PSGist/Get-GistVersion.html"
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Id,

        [Parameter(
            HelpMessageBaseName = "The Version Id of the Gist Object.",
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Version
    )

    Process {
        $apiCall = @{
            #Body = ""
            RestMethod = "gists/{0}/{1}" -f $Id, $Version
            Method = "GET"
        }
    
        foreach ($result in (Invoke-GistApi @apiCall)) {
            [Gist]::new(
                $result
            )
        }
    }
}
