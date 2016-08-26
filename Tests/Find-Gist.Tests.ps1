Describe "Find-GistFile" { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Find-GistFile.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Update-GistFile.ps1

        It "Invoke-ScriptAnalyzer results of Find-GistFile count should be 0." {
            $results.Count | Should Be 0
        }
    }
}
