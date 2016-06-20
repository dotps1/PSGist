---
layout: post
title: Update-GistComment
synopsis: Update a Comment from a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Update-GistComment [-Id] <string> [-CommentId] <string> [-Comment] <string> [-WhatIf] [-Confirm]  [<CommonParameters>]
```

---

#### **Aliases**

None.

---

#### **Description**

Updates an existing comment from a Gist Object using the currently authenticated user context.

---

#### **Parameters**

```
-Comment <string>
    The comment content.
    
    Required?                    true
    Position?                    2
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-CommentId <string>
    The Id of the Gist Object Comment.
    
    Required?                    true
    Position?                    1
    Accept pipeline input?       true (ByPropertyName)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
    
-Confirm
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      cf
    Dynamic?                     false
    
-Id <string>
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

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[GistComment](https://developer.github.com/v3/gists/)

* A custom .net object representation of the JSON repsonse from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to intereact with Gist Objects.

---

#### **Example 1**

Update the body of comment 1806057 from Gist 93258652fee1551dd0c63fbd5a37c8e0.

```
PS C:\> Add-GistComment -Id 93258652fee1551dd0c63fbd5a37c8e0 -Comment 'Temp comment.'


User      : dotps1
Id        : 93258652fee1551dd0c63fbd5a37c8e0
CommentId : 1806057
Body      : Temp comment.




PS C:\> Update-GistComment -Id 93258652fee1551dd0c63fbd5a37c8e0 -CommentId 1806057 'Here is my real comment.'


User      : dotps1
Id        : 93258652fee1551dd0c63fbd5a37c8e0
CommentId : 1806057
Body      : Here is my real comment.
```
