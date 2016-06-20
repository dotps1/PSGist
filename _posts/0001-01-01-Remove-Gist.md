---
layout: post
title: Remove-GistObject
synopsis: Remove a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Remove-Gist [-Id] <string[]> [-WhatIf] [-Confirm]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Removes a Gist Object using the currently authenticated user context.

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
    
-Id <string[]>
    The Id of the Gist Object.
    
    Required?                    true
    Position?                    0
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

There must be an Authenticated User Context to interact with Gist Objects.

---

#### **Example 1**

Removes the oldest Gist of the authenticated user.

```
PS C:\> Get-Gist | Select-Object -Last 1 | Remove-Gist -Confirm:$false
```

#### **Example 2**

Remove the Gist a5b60bdf7955e029a500.

```
Remove-Gist -Id a5b60bdf7955e029a500
```
