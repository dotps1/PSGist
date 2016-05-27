Function Get-Gist {
    [CmdletBinding(
        DefaultParameterSetName = '__AllParameterSets',
        HelpUri = 'http://dotps1.github.io/PSGist/Get-Gist.html'
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = 'The login of the GitHub User.',
            ParameterSetName = 'Owner'
        )]
        [String]
        $Owner,
        
        [Parameter(
            HelpMessage = 'The Id of the Gist Object.',
            ParameterSetName = 'Id'
        )]
        [String]
        $Id,

        [Parameter(
            HelpMessage = 'Target Type for Gist Objects.',
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
