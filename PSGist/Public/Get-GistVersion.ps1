Function Get-GistVersion {
    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Id,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Version
    )

    Process {
        $apiCall = @{
            #Body = ''
            RestMethod = 'gists/{0}/{1}' -f $Id, $Version
            Method = 'GET'
        }
    
        foreach ($result in (Invoke-GistApi @apiCall)) {
            [Gist]::new(
                $result
            )
        }
    }
}
