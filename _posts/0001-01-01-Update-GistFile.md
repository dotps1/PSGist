---
layout: post
title: Update-GistFile
synopsis: Update a File from a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Update-GistFile -Id <string> -Path <string> [-WhatIf] [-Confirm]  [<CommonParameters>]

Update-GistFile -Id <string> [-WhatIf] [-Confirm] [-IseScriptPane] [-FileName <string>]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Updates the contents of a GistFile from a Gist using the currently authenticated user context.

---

#### **Parameters**

```
-Confirm
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      cf
    Dynamic?                     false
    
-FileName <string>
    The name of the Gist file.
    
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
    
-Path <string>
    Path to file(s) where the content will be used for the GistFile.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByValue)
    Parameter set name           Path
    Aliases                      None
    Dynamic?                     false
    
-WhatIf
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      wi
    Dynamic?                     false
    
<CommonParameters>
    This cmdlet supports the common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable, and OutVariable. For more information, see 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
```

---

#### **Inputs**

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

Updates the contents of README.md from Gist 93258652fee1551dd0c63fbd5a37c8e0.

```
Update-GistFile -Id 93258652fee1551dd0c63fbd5a37c8e0 -FileName README.md -Path .\README.md


Owner       : dotps1
Description : Read me file for PSGist.
Id          : 93258652fee1551dd0c63fbd5a37c8e0
CreatedAt   : 5/16/2016 10:51:01 AM
UpdatedAt   : 6/20/2016 3:07:27 PM
Public      : True
HtmlUrl     : https://gist.github.com/93258652fee1551dd0c63fbd5a37c8e0
Files       : README.md
```
