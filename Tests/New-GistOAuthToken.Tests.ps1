Describe 'New-GistOAuthToken' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\New-GistOAuthToken.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\New-GistOAuthToken.ps1 -ExcludeRule PSAvoidUsingConvertToSecureStringWithPlainText

        It 'Invoke-ScriptAnalyzer results of New-GistOAuthToken count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
