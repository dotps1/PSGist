function Remove-GistFile {
    [CmdletBinding(
        ConfirmImpact = 'High', 
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Void]
    )]

    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]] 
        $Id,

        [Parameter(
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
