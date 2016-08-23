# PSGist
## A PowerShell module to interact with GitHub Gists.

[![Build status](https://ci.appveyor.com/api/projects/status/cb3nmam6sqs4b8sv?svg=true)](https://ci.appveyor.com/project/dotps1/psgist)

This is a PowerShell module that uses the GitHub API to interact and manipulate [Gist](https://developer.github.com).


```
PS GitHub:\> Get-Command -Module PSGist | Sort-Object -Property Name | Select-Object -Property Name

Name
----
Add-GistComment
Add-GistFile
Copy-Gist
Find-Gist
Fork-Gist
Get-Gist
Get-GistComment
Get-GistCommit
Get-GistFork
Get-GistVersion
New-Gist
New-GistOAuthToken
Remove-Gist
Remove-GistComment
Remove-GistFile
Rename-GistFile
Save-Gist
Set-Gist
Update-GistComment
Update-GistFile
```


In order to use this module, you will need to create a new GitHub API OAuth Token.  To do this, use the `New-GistOAuthToken` cmdlet.

```
New-GistOAuthToken -Credental <PSCredential>
```

This will generate a new token with access only to Gists to be used by this module.  Once you have authenticated, go ahead and start playing with Gist Objects!

###Update###
Most functions have been updated to include the -IseScriptPane Dynamic Parameter, this will allow you to add and update file(s) in Gist objects using the content directly from the ISE.

Example 1:
Get a specific Gist.
```
PS GitHub:\> Get-Gist | Select-Object -First 1


Owner       : dotps1
Description : Demo Gist for PSGist PowerShell Module.
Id          : fbaba8119507ce58739ca356349cedb1
CreatedAt   : 4/18/2016 3:12:16 PM
UpdatedAt   : 4/18/2016 3:12:16 PM
Public      : True
HtmlUrl     : https://gist.github.com/fbaba8119507ce58739ca356349cedb1
Files       : PSGist.psm1
```

Example 2:
Save a Gist to disk.
```
PS C:\> Get-Gist | Select -First 1 | Save-Gist


    Directory: C:\Users\dotps1\AppData\Roaming\PSGist\62f8f608bdfec5d08552


Mode                LastWriteTime         Length Name                                                                                                                                                                   
----                -------------         ------ ----                                                                                                                                                                   
-a----        4/11/2016  12:32 PM           2080 Register-SophosWebIntelligenceService.ps1         
```

Example 3:
```powershell
# Create a new Gist from an existing file.
New-Gist -Path .\HelloWorld.ps1 -Description 'Hello World Gist.'
```

Example 4:
```powershell
# Create a new Gist using the content from the current active ISE Script Tab.
New-Gist -IseScriptPane -Public
```

Example 5:
```powershell
# Get the first revision of a Gist.
Get-Gist | Select -First 1 | Get-GistCommit | Select -Last 1 | Get-GistVersion
```


Added a new cmdlet to search for Gists:
```
dotps1@mypowerrig GitHub:\PSGist [master ≡] $ Find-Gist -FileNameKeyword Java


Owner       : dotps1
Description : Creates a new Sccm Java Application and Deployment Type.  All three functions are
              required.  (See comments for details.)
Id          : 492023ebd737f9cc46aa
CreatedAt   : 8/14/2015 2:35:19 PM
UpdatedAt   : 4/26/2016 12:09:33 PM
Public      : True
HtmlUrl     : https://gist.github.com/492023ebd737f9cc46aa
Files       : {.New-SccmJavaApplication.ps1, Get-MsiProductCode.ps1,
              Invoke-JavaDownloadAndMsiExtraction.ps1}
```

---

This project is derived from my work with [Trevor Sullivan](https://github.com/pcgeek86) and [PSGitHub](https://github.com/pcgeek86/PSGitHub).  But the more I worked on it, I felt it should be its own module.  Maybe nested in PSGitHub when that is completed...
