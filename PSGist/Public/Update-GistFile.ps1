Function Update-GistFile {
    [CmdletBinding()]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Id,

        [Parameter(
            HelpMessage = 'Path to file where the content will be used to update the Gist file.', 
            Mandatory = $true, 
            ValueFromPipeline = $true
        )]
        [ValidateScript({ 
            if (Test-Path -Path $_) { 
                $true 
            } else { 
                throw "Cannot find path: '$_' because it does not exist." 
            }
        })]
        [ValidateScript({ 
            if (-not (Get-Item -Path $_).PSIsContainer) { 
                $true 
            } else { 
                throw "Path must be to a file." 
            }
        })]
        [String]
        $Path,

        [Parameter()]
        [String]
        $FileName
    )

    DynamicParam {
        # Only present this parameter set if running the PowerShell ISE.
        if ($psISE -ne $null) {
            # Build Attributes for the IseScriptPane Parameter.
            $iseScriptPaneAttributes = New-Object -TypeName System.Management.Automation.ParameterAttribute -Property @{
                HelpMessage = 'Captures the current active ISE Script Pane as Gist content.'
                Mandatory = $true
                ParameterSetName = 'IseScriptPane'
            }
            # Build Collection Object to hold Parameter Attributes.
            $iseScriptPaneCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
            $iseScriptPaneCollection.Add($iseScriptPaneAttributes)
            # Build Runtime Parameter with Collection Parameter Attributes.
            $iseScriptPaneParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter  -ArgumentList ('IseScriptPane', [Switch], $iseScriptPaneCollection)
            
            # Build Runtime Dictionary and add Runtime Parameter to it.
            $dictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
            $dictionary.Add('IseScriptPane', $iseScriptPaneParameter)
            # Return dictionary of Runtime Paramters to the PSCmdlet.
            return $dictionary
        }
    }
    
    Process {
        [HashTable]$body = @{
            files = @{}
        }

        if ($PSCmdlet.ParameterSetName -ne 'IseScriptPane') {
            $body.files.Add(
                $FileName, @{ 
                    content = ((Get-Content -Path $Path -Raw).PSObject.BaseObject) 
                }
            )
        } else {
            $body.files.Add(
                $FileName, @{ 
                    content = $psISE.CurrentPowerShellTab.Files.SelectedFile.Editor.Text 
                }
            )
        }

        $apiCall = @{
            Body = ConvertTo-Json -InputObject $body -Compress
            RestMethod = 'gists/{0}' -f $Id
            Method = 'PATCH'
        }
        
        [Gist]::new(
            (Invoke-GistApi @apiCall)
        )
    }
}
