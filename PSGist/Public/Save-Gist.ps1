Function Save-Gist {
    [CmdletBinding(
        HelpUri = 'http://dotps1.github.io/PSGist'
    )]
    [OutputType(
        [IO.FileInfo]
    )]

    Param (
        [Parameter(
            HelpMessage = 'Path to save the Gist Object.'
        )]
        [String]
        $Path = "$env:APPDATA\PSGist",

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
            $directory = New-Item -Path $Path -Name $item -ItemType Directory -Force
            foreach ($file in (Get-Gist -Id $item).Files) {
                New-Item -Path $directory -Name $file.FileName -ItemType File -Value $($file.Content)
            }
        }
    }
}
