Describe "Get-GistFork" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Get-GistFork.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Get-GistFork.ps1

        It "Invoke-ScriptAnalyzer results of Get-GistFork count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
