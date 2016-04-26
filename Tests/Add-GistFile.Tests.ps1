Describe 'Add-GistFile' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Add-GistFile.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Add-GistFile.ps1

        It 'Invoke-ScriptAnalyzer results of Add-GistFile count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
