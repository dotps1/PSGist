---
layout: post
title: New-GistOAuthToken
synopsis: Create a New OAuth Token.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
New-GistOAuthToken [-Credential] <pscredential> [[-TokenDescription] <string>] [-WhatIf] [-Confirm]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Creates a new OAuth token that will allow for authentication when using PSGist.

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
    
-Credential <pscredential>
    PSCredential object used to autheniticate to GitHub.
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       true (ByValue)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-TokenDescription <string>
    A Description for the generated Token.
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       false
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

[SSystem.Management.Automation.PSCredential](https://msdn.microsoft.com/en-us/library/system.management.automation.pscredential(v=vs.85).aspx)

* Represents a set of security credentials, such as a user name and a password.

---

#### **Outputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Notes**

This OAuth token only has permissions to interact with Gist Objects.

---

#### **Example 1**

Creates a new token based on the value entered into the Get-Credential prompt.

```
PS C:\> Get-Credential | New-GistOAuthToken

00000000-0000-0000-0000-000000000000
```
