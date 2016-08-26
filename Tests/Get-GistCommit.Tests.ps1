Describe "Get-GistCommit" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Get-GistCommit.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Get-GistCommit.ps1

        It "Invoke-ScriptAnalyzer results of Get-GistCommit count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
