Describe 'Rename-GistFile' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Rename-GistFile.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Rename-GistFile.ps1

        It 'Invoke-ScriptAnalyzer results of Rename-GistFile count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
