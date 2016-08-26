Describe "Update-GistComment" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Update-GistComment.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Update-GistComment.ps1

        It "Invoke-ScriptAnalyzer results of Update-GistComment count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
