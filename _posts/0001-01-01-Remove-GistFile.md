---
layout: post
title: Remove-GistFile
synopsis: Remove a File from a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Remove-GistFile [-Id] <string[]> [-FileName] <string[]> [-WhatIf] [-Confirm]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Removes a File from a Gist Object using the currently authenticated user context.
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
    
-FileName <string[]>
    The name of the GistFile.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-Id <string[]>
    The Id of the Gist Object.
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
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

[System.String\[\]](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[System.Void](https://msdn.microsoft.com/en-us/library/system.void%28v=vs.110%29.aspx)

* Specifies a return value type for a method that does not return a value.

---

#### **Notes**

There must be an Authenticated User Context to intereact with Gist Objects.

---

#### **Example 1**

Removes the file ProtectedAttributeCleanup.ps1 from Gist a5b60bdf7955e029a500.

```
PS C:\> Remove-GistFile -Id a5b60bdf7955e029a500 -FileName ProtectedAttributeCleanup.ps1
```
