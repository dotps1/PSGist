Describe 'Set-Gist' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Set-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Set-Gist.ps1

        It 'Invoke-ScriptAnalyzer results of Set-Gist count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
