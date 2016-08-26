Describe "Get-Gist" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Get-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Get-Gist.ps1

        It "Invoke-ScriptAnalyzer results of Get-Gist count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
