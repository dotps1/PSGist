Describe 'Remove-GistFile' { 
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Public\Remove-GistFile.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\PSGist\Public\Remove-GistFile.ps1

        It 'Invoke-ScriptAnalyzer results of Remove-GistFile count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}
