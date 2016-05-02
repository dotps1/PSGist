Function New-Gist {
    [CmdletBinding(
        ConfirmImpact = 'Low',
        HelpUri = 'http://dotps1.github.io/PSGist',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = 'Path to file(s) where the content will be used for the GistFile.', 
            Mandatory = $true, 
            ParameterSetName = 'Path', 
            ValueFromPipeline = $true
        )]
        [ValidateScript({ 
            if (Test-Path -Path $_) { 
                $true 
            } else { 
                throw "Cannot find path: '$_' because it does not exist." 
            }
        })]
        # TODO: Perhaps allow a path to a folder, and then create one Gist with all the files in the top level of the directory?  Just a thought, but for now, no folders.
        # Get-ChildItem -Path $_ -File
        [ValidateScript({ 
            if (-not (Get-Item -Path $_).PSIsContainer) { 
                $true 
            } else { 
                throw "Path must be to a file." 
            }
        })]
        [String[]]
        $Path,

        [Parameter(
            HelpMessage = 'Description of the Gist Object.'
        )]
        [String]
        $Description,

        [Parameter(
            HelpMessage = 'Allows the Gist Object to be viewed by others.'
        )]
        [Switch] 
        $Public
    )

    DynamicParam {
        # Only present this parameter set if running the PowerShell ISE.
        if ($null -ne $psISE) {
            # Build Attributes for the IseScriptPane Parameter.
            $iseScriptPaneAttributes = New-Object -TypeName System.Management.Automation.ParameterAttribute -Property @{
                HelpMessage = 'Captures the current active ISE Script Pane for the GistFile content.'
                ParameterSetName = 'IseScriptPane'
            }
            # Build Collection Object to hold Parameter Attributes.
            $iseScriptPaneCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
            $iseScriptPaneCollection.Add($iseScriptPaneAttributes)
            # Build Runtime Parameter with Collection Parameter Attributes.
            $iseScriptPaneParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter  -ArgumentList ('IseScriptPane', [Switch], $iseScriptPaneCollection)

            # Build Attributes for GistFileName Parameter.
            $gistFileNameAttributes = New-Object -TypeName System.Management.Automation.ParameterAttribute -Property @{
                HelpMessage = 'The name of the Gist file.'
                ParameterSetName = 'IseScriptPane'
            }
            # Build Collection Object to hold Parameter Attributes. 
            $gistFileNameCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
            $gistFileNameCollection.Add($gistFileNameAttributes)
            # Build Runtime Parameter with Collection Parameter Attributes.
            $gistFileNameParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter -ArgumentList ('FileName', [String], $gistFileNameCollection)
            
            # Build Runtime Dictionary and add Runtime Parameters to it.
            $dictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
            $dictionary.Add('IseScriptPane', $iseScriptPaneParameter)
            $dictionary.Add('FileName', $gistFileNameParameter)
            # Return dictionary of Runtime Paramters to the PSCmdlet.
            return $dictionary
        }
    }
    
    Process {
        [HashTable]$body = @{
            description = $Description
            public = $Public.IsPresent
            files = @{}
        }

        if ($PSCmdlet.ParameterSetName -ne 'IseScriptPane') {
            foreach ($item in $Path) {
                $body.files.Add(
                    $(Split-Path -Path $item -Leaf), @{ 
                        content = ((Get-Content -Path $item -Raw).PSObject.BaseObject) 
                    }
                )
            }
        } else {
            if ([String]::IsNullOrEmpty($PSBoundParameters.GistFileName)) {
                $PSBoundParameters.GistFileName = $psISE.CurrentPowerShellTab.Files.SelectedFile.DisplayName.TrimEnd('*')
            }
            
            $body.files.Add(
                $PSBoundParameters.GistFileName, @{ 
                    content = $psISE.CurrentPowerShellTab.Files.SelectedFile.Editor.Text 
                }
            )
        }

        if ($PSCmdlet.ShouldProcess([String]::Empty, 'Create a new Gist object?', $PSCmdlet.MyInvocation.InvocationName)) {
            $apiCall = @{
                Body = ConvertTo-Json -InputObject $body
                RestMethod = 'gists'
                Method = 'POST'
            }
        
            [Gist]::new(
                (Invoke-GistApi @apiCall)
            )
        }
    }
}
