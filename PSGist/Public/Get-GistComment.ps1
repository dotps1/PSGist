Function Get-GistComment {
    [CmdletBinding()]
    [OutputType([GistComment])]
    
    Param (
        [Parameter(
            HelpMessage = 'The Id of the Gist Object.',
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id,
        
        [Parameter(
            HelpMessage = 'The Id of the Gist Object Comment.',
            ParameterSetName = 'SingleComment', 
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $CommentId
    )
    
    Process {
        switch ($PSCmdlet.ParameterSetName) {
            'SingleComment' {
                $restMethod = 'gists/{0}/comments/{1}' -f $Id, $CommentId
            }
            
            default {
                $restMethod = 'gists/{0}/comments' -f $Id
            }
        }
        
        $apiCall = @{
            #Body = ''
            RestMethod = $restMethod
            Method = 'GET'
        }
    
        foreach ($result in (Invoke-GistApi @apiCall)) {
            [GistComment]::new(
                $result, $Id
            )
        }
    }
}
