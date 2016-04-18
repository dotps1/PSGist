Function Get-Gist {
    [CmdletBinding(
        DefaultParameterSetName = '__AllParameterSets'
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            ParameterSetName = 'Owner'
        )]
        [String]
        $Owner,
        
        [Parameter(
            ParameterSetName = 'Id'
        )]
        [String]
        $Id,

        [Parameter(
            ParameterSetName = 'Target'
        )]
        [ValidateSet(
            'Public', 
            'Starred'
        )]
        [String]
        $Target
    )

    Process {
        switch ($PSCmdlet.ParameterSetName) {
            'Owner' { 
                $restMethod = 'users/{0}/gists' -f $Owner
            }
        
            'Id' { 
                $restMethod = 'gists/{0}' -f $Id
            }

            'Target' {
                switch ($Target) {
                    'Public' { 
                        $restMethod = 'gists/public'
                    }
                    'Starred' { 
                        $restMethod = 'gists/starred' 
                    }
                }
            }

            default { 
                $restMethod = 'gists'
            }
        }

        $apiCall = @{
            #Body = ''
            RestMethod = $restMethod
            Method = 'GET'
        }
    
        foreach ($result in (Invoke-GistApi @apiCall)) {
            [Gist]::new(
                $result
            )
        }
    }
}
