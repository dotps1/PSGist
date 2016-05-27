Function Update-GistComment {
    [CmdletBinding(
        ConfirmImpact = 'Medium',
        HelpUri = 'http://dotps1.github.io/PSGist/Update-GistComment.html',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [GistComment]
    )]

    Param (
        [Parameter(
            HelpMessage = 'The Id of the Gist Object.',
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Id,
        
        [Parameter(
            HelpMessage = 'The Id of the Gist Object Comment.',
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $CommentId,
    
        [Parameter(
            HelpMessage = 'The comment content.',
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Comment
    )
    
    Process {
        [HashTable]$body = @{
            body = $Comment
        }
        
        if ($PSCmdlet.ShouldProcess($Id)) {
            $apiCall = @{
                Body = ConvertTo-Json -InputObject $body -Compress
                RestMethod = 'gists/{0}/comments/{1}' -f $Id, $CommentId
                Method = 'PATCH' 
            }
            
            [GistComment]::new(
                (Invoke-GistApi @apiCall), $Id   
            )
        }
    }   
}
