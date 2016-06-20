---
layout: post
title: Set-GistOAuthToken
synopsis: Set the value of GIST_OAUTH_TOKEN.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Set-GistOAuthToken [[-Token] <string>] [-WhatIf] [-Confirm]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Sets the $env:GIST_OATH_TOKEN value.

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
    
-Token <string>
    Token value to assign the environment variable GIST_OAUTH_TOKEN.
    
    Required?                    false
    Position?                    0
    Accept pipeline input?       true (ByValue, ByPropertyName)
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

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Notes**

After creating an OAuth token, the value is not able to be retrieved, which means this function will rarely be needed.

---

#### **Example 1**

Sets the $env:GIST_OAUTH_TOKEN value to 00000000-0000-0000-0000-000000000000.

```
PS C:\> Set-GistOAuthToken -Token 00000000-0000-0000-0000-000000000000 -Confirm:$false
```
