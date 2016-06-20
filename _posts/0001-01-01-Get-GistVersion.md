---
layout: post
title: Get-GistVersion
synopsis: Get a Version of a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Get-GistVersion [-Id] <string> [-Version] <string>  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**
Get a specific revision of a Gist Object using the currently authenticated user context.
---

#### **Parameters**

```
-Id <string>
    The Id of the Gist Object.
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-Version <string>
    
    Required?                    true
    Position?                    1
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
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

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[Gist](https://developer.github.com/v3/gists/)

* A custom .net object representation of the JSON response from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to interact with Gist Objects.

---

#### **Example 1**

Gets the specific revision f1118a739588f8f9870bee3d7272c59163533b5e for Gist a5b60bdf7955e029a500.

```
PS C:\> Get-GistVersion -Id a5b60bdf7955e029a500  -Version f1118a739588f8f9870bee3d7272c59163533b5e


Owner       : dotps1
Description : Find users in a domain that have the protected attribute that should not, remove that attribute and re enable inheritance.
Id          : a5b60bdf7955e029a500
CreatedAt   : 2/3/2016 3:20:37 PM
UpdatedAt   : 2/4/2016 11:59:19 AM
Public      : True
HtmlUrl     : https://gist.github.com/a5b60bdf7955e029a500
Files       : ProtectedAttributeCleanup.ps1
```

#### **Example 2**

Get the first revision content of Gist a5b60bdf7955e029a500.

```
PS C:\> Get-GistCommit -Id a5b60bdf7955e029a500 | Select-Object -Last 1 | Get-GistVersion


Owner       : dotps1
Description : Find users in a domain that have the protected attribute that should not, remove that attribute
              and re enable inheritance.
Id          : a5b60bdf7955e029a500
CreatedAt   : 2/3/2016 3:20:37 PM
UpdatedAt   : 2/4/2016 11:59:19 AM
Public      : True
HtmlUrl     : https://gist.github.com/a5b60bdf7955e029a500
Files       : ProtectedAttributeCleanup.ps1
```
