Function Get-Gist {
    [CmdletBinding(
        DefaultParameterSetName = "__AllParameterSets",
        HelpUri = "http://dotps1.github.io/PSGist/Get-Gist.html"
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = "The username of the GitHub User.",
            ParameterSetName = "Owner",
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Owner,
        
        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            ParameterSetName = "Id",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id,

        [Parameter(
            HelpMessage = "Get Gists that have been starred.",
            ParameterSetName = "Starred"
        )]
        [Switch]
        $Starred
    )

    Process {
        switch ($PSCmdlet.ParameterSetName) {
            "Owner" {
                foreach ($item in $Owner) {
                    foreach ($result in (Invoke-GistApi -RestMethod "users/$item/gists" -Method "GET")) {
                        [Gist]::new(
                            $result
                        )
                    }
                }
            }
        
            "Id" { 
                foreach ($item in $Id) {
                    foreach ($result in (Invoke-GistApi -RestMethod "gists/$item" -Method "GET")) {
                        [Gist]::new(
                            $result
                        )
                    }
                }
            }

            "Starred" {
                foreach ($result in (Invoke-GistApi -RestMethod "gists/starred" -Method "GET")) {
                    [Gist]::new(
                        $result
                    )
                }
            }

            default {
                foreach ($result in (Invoke-GistApi -RestMethod "gists" -Method "GET")) {
                    [Gist]::new(
                        $result
                    )
                }
            }
        }
    }
}
