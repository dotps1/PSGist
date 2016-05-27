Function Rename-GistFile {
    [CmdletBinding(
        HelpUri = 'http://dotps1.github.io/PSGist/Rename-GistFile.html'
    )]
    [OutputType(
        [Gist]
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
            HelpMessage = 'Current name of the GistFile.',
            Mandatory = $true
        )]
        [String]
        $OldName,

        [Parameter(
            HelpMessage = 'New name of the GistFile.',
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
