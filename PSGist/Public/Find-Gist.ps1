Function Find-Gist {

    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter()]
        [String]
        $Username = ((Import-Clixml -Path $env:AppData\PSGist\Private\OAuthToken.xml -ErrorAction Stop).GetNetworkCredential().Username),

        [Parameter(
            Mandatory = $true
        )]
        [String]
        $FileNameKeyword

    )

    $uri = "https://gist.github.com/search?q=user%3A{0}" -f $Username

    foreach ($word in ($FileNameKeyword -split " ")) {
        $uri += "+{0}" -f $word
    }

    $gistLinks = (Invoke-WebRequest -Uri $uri).Links |
        Select-Object -ExpandProperty href |
            Where-Object {
                $_ -match "https://gist.github.com/{0}" -f $Username
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
