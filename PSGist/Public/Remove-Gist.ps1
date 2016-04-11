function Remove-Gist {
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

        [Parameter()]
        [String[]]
        $FileName
    )
    
    Process {
        foreach ($item in $Id) {
            if ($PSCmdlet.ShouldProcess($item)) {
                if ($FileName -ne $null) {
                    [HashTable]$body = @{
                        files = @{}
                    }
                    foreach ($file in $FileName) {
                        $body.files.Add($file, $null)
                    }
                    $restMethod = 'PATCH'
                } else {
                    $body = $null
                    $restMethod = 'DELETE'
                }
                
                $apiCall = @{
                    Body = ConvertTo-Json -InputObject $body
                    RestMethod = 'gists/{0}' -f $item
                    Method = $restMethod
                }
    
                Invoke-GistApi @apiCall
            }
        }
    }
}
