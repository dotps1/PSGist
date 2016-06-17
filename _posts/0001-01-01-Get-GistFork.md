---
layout: post
title: Get-GistFork
synopsis: Get a Fork of a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Get-GistFork [-Id] <String[]>
```

---

#### **Aliases**

None.

---

#### **Description**

Get a Fork from a Gist Object using the currently authenticated user context.

---

#### **Parameters**

[Id \<String\[\]\>](https://developer.github.com/v3/gists/#get-a-single-gist)

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

* A custom .net object representation of the JSON response from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to interact with Gist Objects.

---

#### **Example 1**

Gets the Forks of Gist e3b5bf37aea3a84b0a40c20d405cdc97.

```
PS C:\> Get-GistFork -Id e3b5bf37aea3a84b0a40c20d405cdc97


User      : robderickson
Id        : c577e5937feefba8ef7fb59211c1053a
CreatedAt : 6/17/2016 1:37:26 PM
UpdatedAt : 6/17/2016 1:37:26 PM
Url       : https://api.github.com/gists/c577e5937feefba8ef7fb59211c1053a
```

#### **Example 2**

Get the users Forked version of Gist e3b5bf37aea3a84b0a40c20d405cdc97.

```
PS C:\> $fork = Get-GistFork -Id e3b5bf37aea3a84b0a40c20d405cdc97 | Select-Object -First 1; Get-Gist -Id $fork.Id


Owner       : robderickson
Description :
Id          : c577e5937feefba8ef7fb59211c1053a
CreatedAt   : 6/17/2016 1:37:26 PM
UpdatedAt   : 6/17/2016 1:37:26 PM
Public      : True
HtmlUrl     : https://gist.github.com/c577e5937feefba8ef7fb59211c1053a
Files       : DisableLogMeInPatchManagement.ps1
```
