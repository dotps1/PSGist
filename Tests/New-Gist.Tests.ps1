Describe 'New-Gist' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\New-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\New-Gist.ps1

        It 'Invoke-ScriptAnalyzer results of New-Gist count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
