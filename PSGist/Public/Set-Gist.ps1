Function Set-Gist {
    [CmdletBinding(
        ConfirmImpact = "Low",
        HelpUri = "http://dotps1.github.io/PSGist/Set-Gist.html",
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Gist],
        [Void]
    )]
    
    Param (
        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id,

        [Parameter(
            HelpMessage = "Description of the Gist Object.",
            ParameterSetName = "Description"
        )]
        [String]
        $Description,

        [Parameter(
            HelpMessage = "The Starred state of a Gist Object.",
            ParameterSetName = "Star"
        )]
        [Bool]
        $Star
    )

    Process {
        foreach ($item in $Id) {
            if ($PSCmdlet.ShouldProcess($item)) {
                switch ($PSCmdlet.ParameterSetName) {
                    "Description" {
                        [HashTable]$body = @{
                            description = $Description
                        }

                        $apiCall = @{
                            Body = ConvertTo-Json -InputObject $body -Compress
                            RestMethod = "gists/{0}" -f $item
                            Method = "PATCH"
                        }

                        [Gist]::new(
                            (Invoke-GistApi @apiCall)
                        )
                    }

                    "Star" {
                        if ($Star -eq $true) {
                            $method = "PUT"
                        } else {
                            $method = "DELETE" 
                        }

                        $apiCall = @{
                            #Body = ""
                            RestMethod = "gists/{0}/star" -f $item
                            Method = $method
                        }

                        Invoke-GistApi @apiCall
                    }
                }
            }
        }
    }
}
