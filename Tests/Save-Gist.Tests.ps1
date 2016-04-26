Describe 'Save-Gist' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Save-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Save-Gist.ps1

        It 'Invoke-ScriptAnalyzer results of Save-Gist count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
