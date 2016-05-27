function Remove-GistFile {
    [CmdletBinding(
        ConfirmImpact = 'High',
        HelpUri = 'http://dotps1.github.io/PSGist/Remove-GistFile.html',
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
        $Id,

        [Parameter(
            HelpMessage = 'The name of the GistFile.',
            Mandatory = $true    
        )]
        [String[]]
        $FileName
    )
    
    Process {
        foreach ($item in $Id) {
            [HashTable]$body = @{
                files = @{}
            }

            foreach ($file in $FileName) {
                $body.files.Add($file, $null)
            }
                
            if ($PSCmdlet.ShouldProcess($item)) {
                $apiCall = @{
                    Body = ConvertTo-Json -InputObject $body
                    RestMethod = 'gists/{0}' -f $item
                    Method = 'PATCH'
                }
    
                Invoke-GistApi @apiCall | Out-Null
            }
        }
    }
}
