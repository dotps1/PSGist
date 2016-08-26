Describe "Add-GistComment" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Add-GistComment.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Add-GistComment.ps1

        It "Invoke-ScriptAnalyzer results of Add-GistComment count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
