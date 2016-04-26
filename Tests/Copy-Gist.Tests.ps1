Describe 'Copy-Gist' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Copy-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Copy-Gist.ps1

        It 'Invoke-ScriptAnalyzer results of Copy-Gist count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
