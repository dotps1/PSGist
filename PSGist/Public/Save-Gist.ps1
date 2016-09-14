Function Save-Gist {
    [CmdletBinding(
        HelpUri = "http://dotps1.github.io/PSGist/Save-Gist.html"
    )]
    [OutputType(
        [IO.FileInfo]
    )]

    Param (
        [Parameter(
            HelpMessage = "Path to save the Gist Object."
        )]
        [String]
        $Path = "$env:APPDATA\PSGist",

        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Id
    )

    Process {
        foreach ($item in $Id) {
            (Get-Gist -Id $item).Save(
                $Path
            )
        }
    }
}
