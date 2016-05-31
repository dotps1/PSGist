---
layout: post
title: Get-GistComment
synopsis: Get a Comment from a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

__ AllParameterSets

```
Get-GistComment -Id <String> 
```

SingleComment

```
Get-GistComment -Id <String> -CommentId <String>
```

---

#### **Aliases**

None.

---

#### **Description**

Get a Comment from a Gist Object using the currently authenticated user context.

---

#### **Parameters**

[Id \<String\>](https://developer.github.com/v3/gists/#get-a-single-gist)

The unique Id of a Gist Object.

* ParameterSets: All
* Aliases: None
* Required: True
* Position: Named
* Default Value:
* Accept Pipeline Input: True (ByPropertyNameValue)
* Accept Wildcard Characters: False

[CommentId \<String\>](https://developer.github.com/v3/gists/comments/#get-a-single-comment)

THe unique Id of a Comment from a Gist Object.

* ParameterSets: SingleComment
* Aliases: None
* Required: True
* Position: Named
* Default Value:
* Accept Pipeline Input: True (ByPropertyNameValue)
* Accept Wildcard Characters: False

[CommonParameters \<CommonParameters\>](http://go.microsoft.com/fwlink/?LinkID=113216)

This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.

---

#### **Inputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[PSGist.GistComment](https://developer.github.com/v3/gists/comments)

* A custom .net object representation of the JSON repsonse from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to intereact with Gist Objects.

---

#### **Example 1**

```

```
