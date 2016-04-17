Function Rename-GistFile {
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
        [HashTable]$body = @{
            files = @{ 
                $OldName = @{ 
                    filename = $NewName 
                } 
            }
        }

        $apiCall = @{
            Body = ConvertTo-Json -InputObject $body
            RestMethod = 'gists/{0}' -f $Id
            Method = 'PATCH'
        }
            
        [Gist]::new(
            (Invoke-GistApi @apiCall)
        )
    }
}
