---
layout: post
title: Rename-GistFile
synopsis: Rename a File from a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

##### **ParamSet**
```
Rename-GistFile [-Id] <string> [-OldName] <string> [-NewName] <string>  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Renames a Gist File using the currently authenticated user context.
---

#### **Parameters**

```
-Id <string>
    The Id of the Gist Object.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-NewName <string>
    New name of the GistFile.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-OldName <string>
    Current name of the GistFile.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       false
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

[System.String\[\]](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

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

Renames the file MisNamedFile.ps1 to ProtectedAttributeCleanup.ps1 from Gist a5b60bdf7955e029a500.

```
PS C:\> Rename-GistFile -Id a5b60bdf7955e029a500 -OldName MisNamedFile.ps1 -NewName ProtectedAttributeCleanup.ps1


Owner       : dotps1
Description : Find users in a domain that have the protected attribute that should not, remove that attribute and re enable inheritance.
Id          : a5b60bdf7955e029a500
CreatedAt   : 2/3/2016 3:20:37 PM
UpdatedAt   : 2/4/2016 11:59:19 AM
Public      : True
HtmlUrl     : https://gist.github.com/a5b60bdf7955e029a500
Files       : ProtectedAttributeCleanup.ps1
```
