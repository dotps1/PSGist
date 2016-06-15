---
layout: post
title: Get-GistCommit
synopsis: Get a Commit of Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Get-GistCommit [-Id] <String[]>
```

---

#### **Aliases**

None.

---

#### **Description**

Get a Commit from a Gist Object using the currently authenticated user context.

---

#### **Parameters**

[Id \<Id\>](https://developer.github.com/v3/gists/#get-a-single-gist)

The unique Id of a Gist Object.

* ParameterSets: All
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

[System.String\[\]](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

---

#### **Outputs**

[PSGist.Gist](https://developer.github.com/v3/gists/)

* A custom .net object representation of the JSON repsonse from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to intereact with Gist Objects.

---

#### **Example 1**

Get the Commits for Gist a5b60bdf7955e029a500.

```
PS C:\> Get-GistCommit -Id a5b60bdf7955e029a500


User        : dotps1
Version     : 53ca8f8310ff274f43206e4228db30232076c1b0
CommittedAt : 2/3/2016 3:33:01 PM
Additions   : 1
Deletions   : 1

User        : dotps1
Version     : b3d3f9a56a27fc78780827bd9deaaa0a0b7c14f6
CommittedAt : 2/3/2016 3:31:53 PM
Additions   : 1
Deletions   : 1

User        : dotps1
Version     : f1118a739588f8f9870bee3d7272c59163533b5e
CommittedAt : 2/3/2016 3:20:37 PM
Additions   : 33
Deletions   : 0
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
