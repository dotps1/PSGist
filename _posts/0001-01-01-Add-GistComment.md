---
layout: post
title: Add-GistComment
synopsis: Add a Comment to a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Add-GistComment [-Id] <String> [-Comment] <String>
```

---

#### **Aliases**

None.

---

#### **Description**

Adds a comment to a Gist Object using the currently authenticated user context.

---

#### **Parameters**

[Id \<String\>](https://developer.github.com/v3/gists/#get-a-single-gist)

The unique Id of a Gist Object.

* ParameterSets: All
* Aliases: None
* Required: True
* Position: Named
* Default Value:
* Accept Pipeline Input: True (ByPropertyName)
* Accept Wildcard Characters: False

[Comment \<String\>]()

The comment to be added to the Gist Object.

* ParameterSets: All
* Aliases: None
* Required: True
* Position: Named
* Default Value: 
* Accept Pipeline Input: True (ByPropertyName)
* Accept Wildcard Characters: False

[CommonParameters \<CommonParameters\>](http://go.microsoft.com/fwlink/?LinkID=113216)

This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.

---

#### **Inputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[PSGist.GistComment](https://developer.github.com/v3/gists/comments/)

* A custom .net object representation of the JSON response from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to interact with Gist Objects.

---

#### **Example 1**

Add the comment 'Test comment added through PSGist.' to the Gist '93258652fee1551dd0c63fbd5a37c8e0'.

```
PS C:\> Add-GistComment -Id 93258652fee1551dd0c63fbd5a37c8e0 -Comment 'Test comment added through PSGist.'


User      : dotps1
Id        : 93258652fee1551dd0c63fbd5a37c8e0
CommentId : 1788460
Body      : Test comment added through PSGist.
```
