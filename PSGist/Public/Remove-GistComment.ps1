Function Remove-GistComment {
    [CmdletBinding(
        ConfirmImpact = 'High',
        HelpUri = 'http://dotps1.github.io/PSGist/Remove-GistComment.html',
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
        $CommentId
    )
    
    Process {
        if ($PSCmdlet.ShouldProcess($Id)) {
            $apiCall = @{
                #Body = ''
                RestMethod = 'gists/{0}/comments/{1}' -f $Id, $CommentId
                Method = 'DELETE' 
            }
            
            Invoke-GistApi @apiCall
        }
    }   
}
