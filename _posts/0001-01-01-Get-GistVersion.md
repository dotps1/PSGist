---
layout: post
title: Get-GistVersion
synopsis: Get a Version of a Gist Object.
---

---

#### **Synopsis**

{{ page.synopsis }}

---

#### **Syntax**

```
Get-GistVersion [-Id] <string> [-Version] <string>
```

---

#### **Aliases**

None.

---

#### **Description**
Get a specific revision of a Gist Object using the currently authenticated user context.
---

#### **Parameters**

[Id \<String>](https://developer.github.com/v3/gists/#get-a-single-gist)

The unique Id of a Gist Object.

* ParameterSets: All
* Aliases: None
* Required: True
* Position: Named
* Default Value:
* Accept Pipeline Input: True (ByPropertyNameValue)
* Accept Wildcard Characters: False

[Version \<String\>]()



* Required:
* Position:
* Default Value:
* Accept Pipeline Input:
* Accept Wildcard Characters:

[CommonParameters \<CommonParameters\>](http://go.microsoft.com/fwlink/?LinkID=113216)

This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.

---

#### **Inputs**

[System.String](https://msdn.microsoft.com/en-us/library/system.string%28v=vs.110%29.aspx)

* Represents text as a sequence of UTF-16 code units.

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

```

```
