Describe "Get-GistVersion" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Get-GistVersion.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Get-GistVersion.ps1

        It "Invoke-ScriptAnalyzer results of Get-GistVersion count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
