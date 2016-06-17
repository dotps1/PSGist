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

[Id \<String\[\]\>](https://developer.github.com/v3/gists/#get-a-single-gist)

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

* A custom .net object representation of the JSON response from the [GitHub API](https://developer.github.com).

---

#### **Notes**

There must be an Authenticated User Context to interact with Gist Objects.

---

#### **Example 1**

Gets the comments from Gist 492023ebd737f9cc46aa.

```
PS C:\> Get-GistComment -Id 492023ebd737f9cc46aa


User      : dotps1
Id        : 492023ebd737f9cc46aa
CommentId : 1563608
Body      : 1. Download both x86 and x64 versions of the Java Offline Installer.
            2. Run the x86 exe which extracts the msi to the current users Application Data.  (This will show the Java
            installer windows, DO NOT CLOSE THIS WINDOW!  The script will do so at the appropriate time.)
            3. After the msi exists, terminate all the running java process.
            4. Run the x64 exe which extracts the msi to the current users Application Data.  (This will show the Java
            installer windows, DO NOT CLOSE THIS WINDOW!  The script will do so at the appropriate time.)
            5. After the msi exists, terminate all the running java process.
            6. Create the package directory specified in the SoucesPath.
            7. Copy both msi's to that path.
            8. Extract the Installer Script to the package directory.
            9. Sign the installer script.
            10. Extract the java installer properties file to the package directory.
            11. Import the Config Manager assemblies,  (I did this by sharing the programs dir, notice line 143/144,
            the 'AdminConsole$' is my sharename).
            12. Create the Application Management Object.
            13. Create the Deployment Type Object.
            14. Create the Content Object.
            15. Add the Content Object and the Deployment Type Object to the Application Management Object.
            16. Create the application on the SCCM Server.
            17. Move the application to the correct folder, (if a folder was supplied, else it will exist in the root
            application directory).

User      : dotps1
Id        : 492023ebd737f9cc46aa
CommentId : 1748206
Body      : ***UPDATE***
            Now invokes an implicit PSSession to the SCCM Server to get the ConfigurationManager ps module, so the
            share is no longer needed to get tto that.
```


#### **Example 2**

Gets the Gist 492023ebd737f9cc46aa then via the Pipeline gets the comments, and expands the Body property.

```
PS C:\> Get-Gist -Id 492023ebd737f9cc46aa | Get-GistComment | Select-Object -ExpandProperty Body
1. Download both x86 and x64 versions of the Java Offline Installer.
2. Run the x86 exe which extracts the msi to the current users Application Data.  (This will show the Java installer windows, DO NOT CLOSE THIS WINDOW!  The script will do so at the appropriate time.)
3. After the msi exists, terminate all the running java process.
4. Run the x64 exe which extracts the msi to the current users Application Data.  (This will show the Java installer windows, DO NOT CLOSE THIS WINDOW!  The script will do so at the appropriate time.)
5. After the msi exists, terminate all the running java process.
6. Create the package directory specified in the SoucesPath.
7. Copy both msi's to that path.
8. Extract the Installer Script to the package directory.
9. Sign the installer script.
10. Extract the java installer properties file to the package directory.
11. Import the Config Manager assemblies,  (I did this by sharing the programs dir, notice line 143/144, the 'AdminConsole$' is my sharename).
12. Create the Application Management Object.
13. Create the Deployment Type Object.
14. Create the Content Object.
15. Add the Content Object and the Deployment Type Object to the Application Management Object.
16. Create the application on the SCCM Server.
17. Move the application to the correct folder, (if a folder was supplied, else it will exist in the root application directory).
***UPDATE***
Now invokes an implicit PSSession to the SCCM Server to get the ConfigurationManager ps module, so the share is no longer needed to get tto that.
```
