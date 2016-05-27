function Remove-Gist {
    [CmdletBinding(
        ConfirmImpact = 'High',
        HelpUri = 'http://dotps1.github.io/PSGist/Remove-Gist.html',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Void]
    )]

    Param (
        [Parameter(
            HelpMessage = 'The Id of the Gist Object.',
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]] 
        $Id
    )
    
    Process {
        foreach ($item in $Id) {
            if ($PSCmdlet.ShouldProcess($item)) {
                $apiCall = @{
                    #Body = ''
                    RestMethod = 'gists/{0}' -f $item
                    Method = 'DELETE'
                }
    
                Invoke-GistApi @apiCall
            }
        }
    }
}
