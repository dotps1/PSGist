Function Set-Gist {
    [CmdletBinding(
        ConfirmImpact = 'Low', 
        SupportsShouldProcess = $true
    )]
    [OutputType()]
    
    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id,

        [Parameter(
            ParameterSetName = 'Description'
        )]
        [String]
        $Description,

        [Parameter(
            ParameterSetName = 'Star'
        )]
        [Bool]
        $Star
    )

    Process {
        foreach ($item in $Id) {
            if ($PSCmdlet.ShouldProcess($item)) {
                switch ($PSCmdlet.ParameterSetName) {
                    'Description' {
                        [HashTable]$body = @{
                            description = $Description
                        }

                        $apiCall = @{
                            Body = ConvertTo-Json -InputObject $body -Compress
                            RestMethod = 'gists/{0}' -f $item
                            Method = 'PATCH'
                        }

                        [Gist]::new(
                            (Invoke-GistApi @apiCall)
                        )
                    }

                    'Star' {
                        if ($Star -eq $true) {
                            $method = 'PUT'
                        } else {
                            $method = 'DELETE' 
                        }

                        $apiCall = @{
                            #Body = ''
                            RestMethod = 'gists/{0}/star' -f $item
                            Method = $method
                        }

                        Invoke-GistApi @apiCall
                    }
                }
            }
        }
    }
}
