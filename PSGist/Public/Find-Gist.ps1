Function Find-Gist {

    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = "The username of the GitHub User."
        )]
        [String]
        $Owner = ((Import-Clixml -Path $env:AppData\PSGist\Private\OAuthToken.xml -ErrorAction Stop).GetNetworkCredential().Username),

        [Parameter(
            HelpMessage = "The keywords to search for in the Gist filename.",
            Mandatory = $true
        )]
        [String]
        $FileNameKeyword

    )

    $uri = "https://gist.github.com/search?q=user%3A{0}" -f $Owner

    foreach ($word in (-split $FileNameKeyword)) {
        $uri += "+{0}" -f $word
    }

    $gistLinks = (Invoke-WebRequest -Uri $uri).Links |
        Select-Object -ExpandProperty href |
            Where-Object {
                $_ -match "https://gist.github.com/{0}" -f $Owner
            }

    if ($null -eq $gistLinks) {
        Write-Error -Message "No Gists found."
    } else {
        foreach ($link in $gistLinks) {
            $uri = $link -as [Uri]
            $gistId = $uri.Segments[$uri.Segments.Count - 1]

            Get-Gist -Id $gistId
        }
    }
}
