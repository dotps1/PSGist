---
layout: post
title: Add-GistFile
synopsis: Add a file to an existing Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Add-GistFile -Id <string> -Path <string[]>  [<CommonParameters>]

Add-GistFile -Id <string> [-IseScriptPane] [-FileName <string>]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Add one or more files to an existing Gist Object using the currently authenticated user context.

---

#### **Parameters**

```
-FileName <string>
    The name of the GistFile.
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           IseScriptPane
    Aliases                      None
    Dynamic?                     true
    
-Id <string>
    The Id of the Gist Object.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-IseScriptPane
    Captures the current active ISE Script Pane for the GistFile content.
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           IseScriptPane
    Aliases                      None
    Dynamic?                     true
    
-Path <string[]>
    Path to file(s) where the content will be used for the GistFile.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByValue)
    Parameter set name           Path
    Aliases                      None
    Dynamic?                     false
    
<CommonParameters>
    This cmdlet supports the common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable, and OutVariable. For more information, see 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
```

---

#### **Inputs**

[System.String\[\]](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[Gist](https://developer.github.com/v3/gists/)

* A custom .net object representation of the JSON response from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to interact with Gist Objects.
The IseScriptPane Parameter Set is only available from within the PowerShell_Ise Application.

---

#### **Example 1**

Add the file 'AddGistFile.ps1' to the Gist '93258652fee1551dd0c63fbd5a37c8e0'.

```
PS C:\> Add-GistFile -Id 93258652fee1551dd0c63fbd5a37c8e0 -Path .\AddGistFile.ps1


Owner       : dotps1
Description : Read me file for PSGist.
Id          : 93258652fee1551dd0c63fbd5a37c8e0
CreatedAt   : 1/1/2016 00:00:00 AM
UpdatedAt   : 1/1/2016 00:00:00 AM
Public      : True
HtmlUrl     : https://gist.github.com/93258652fee1551dd0c63fbd5a37c8e0
Files       : {AddGistFile.ps1, README.md}
```

#### **Example 2**

Add the content from the current ISE Script Pane and create a new file called 'IseScriptPaneContent.ps1' and add the file to the Gist '93258652fee1551dd0c63fbd5a37c8e0'.

```
PS C:\> Add-GistFile -Id 93258652fee1551dd0c63fbd5a37c8e0 -IseScriptPane -FileName IseScriptPaneContent.ps1


Owner       : dotps1
Description : Read me file for PSGist.
Id          : 93258652fee1551dd0c63fbd5a37c8e0
CreatedAt   : 1/1/2016 00:00:00 AM
UpdatedAt   : 1/1/2016 00:00:00 AM
Public      : True
HtmlUrl     : https://gist.github.com/93258652fee1551dd0c63fbd5a37c8e0
Files       : {IseScriptPaneContent.ps1, README.md}
```
