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

Path

```
Add-GistFile -Id <String> -Path <String[]>
```

IseScriptPane

```
Add-GistFile -Id <String> [-IseScriptPane] [-FileName <String>]
```

---

#### **Aliases**

None.

---

#### **Description**

Add one or more files to an existing Gist Object using the currently authenticated user context.

---

#### **Parameters**

[Id \<String\>](https://developer.github.com/v3/gists/#get-a-single-gist)

The unique Id of a Gist Object.

* Parameter Sets: All
* Aliases: None
* Required: True
* Position: Named
* Default Value:
* Accept Pipeline Input: True (ByPropertyName)
* Accept Wildcard Characters: False

[Path \<String\[\]\>]()

The path to file(s) to add to the Gist Object.

* Parameter Sets: Path
* Aliases: None
* Required: True
* Position: Named
* Default Value: 
* Accept Pipeline Input: True (ByValue)
* Accept Wildcard Characters: False

[IseScriptPane \<Switch\>]()

Use the content from the current active script pane as content for the new Gist File.

* Parameter Sets: IseScriptPane
* Aliases: None
* Required: False
* Position: Named
* Default Value:
* Accept Pipeline Input: False
* Accept Wildcard Characters: False

[FileName \<String\>]()

The name of the file to be created if using the content from the Ise.

* Parameter Sets: IseScriptPane
* Aliases: None
* Required: False
* Position: Named
* Default Value: $psISE.CurrentFile.DisplayName.TrimEnd('*')
* Accept Pipeline Input: False
* Accept Wildcard Characters: False

[CommonParameters \<CommonParameters\>](http://go.microsoft.com/fwlink/?LinkID=113216)

This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.

---

#### **Inputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

[System.String\[\]](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[PSGist.Gist](https://developer.github.com/v3/gists/)

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
