Function Save-Gist {
    [CmdletBinding()]
    [OutputType()]

    Param (
        [Parameter()]
        [String]
        $Path = "$env:APPDATA\PSGist",

        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id
    )

    Process {
        foreach ($item in $Id) {
            $directory = New-Item -Path $Path -Name $item -ItemType Directory -Force
            foreach ($file in (Get-Gist -Id $item).Files) {
                New-Item -Path $directory -Name $file.FileName -ItemType File -Value $($file.Content)
            }
        }
    }
}
