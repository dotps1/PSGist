Describe 'Remove-GistComment' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Remove-GistComment.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Remove-GistComment.ps1

        It 'Invoke-ScriptAnalyzer results of Remove-GistComment count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
