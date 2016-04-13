Function Update-GistFile {
    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]
    
    Param (
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $Id,

        [Parameter(
            Mandatory = $true
        )]
        [String]
        $OldName,

        [Parameter(
            Mandatory = $true
        )]
        [String]
        $NewName
    )

    Process {
        $apiCall = @{
            #Body = ''
            RestMethod = $restMethod
            Method = $method
        }
            
        Invoke-GistApi @apiCall
    }
}
