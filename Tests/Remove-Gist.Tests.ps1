Describe "Remove-Gist" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Remove-Gist.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Remove-Gist.ps1

        It "Invoke-ScriptAnalyzer results of Remove-Gist count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
