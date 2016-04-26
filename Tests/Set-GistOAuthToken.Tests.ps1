Describe 'Set-GistOAuthToken' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Set-GistOAuthToken.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Set-GistOAuthToken.ps1

        It 'Invoke-ScriptAnalyzer results of Set-GistOAuthToken count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
