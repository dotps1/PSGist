Describe 'Get-GistComment' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Get-GistComment.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Get-GistComment.ps1

        It 'Invoke-ScriptAnalyzer results of Get-Gist count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
