# PSGist
## A PowerShell module to interact with GitHub Gists.

[![Build status](https://ci.appveyor.com/api/projects/status/8tldqe5wr9y3fcf8?svg=true)](https://ci.appveyor.com/project/dotps1/psgist)

This is a PowerShell module that uses the GitHub API to interact and manipulate [Gist](https://developer.github.com).


```
PS GitHub:\> Get-Command -Module PSGist | Sort Name

CommandType     Name                                               Version    Source                                                                                                                                                  
-----------     ----                                               -------    ------                                                                                                                                                  
Function        Add-GistFile                                       1.3        PSGist                                                                                                                                                  
Function        Copy-Gist                                          1.3        PSGist                                                                                                                                                  
Alias           Fork-Gist                                          1.3        PSGist                                                                                                                                                  
Function        Get-Gist                                           1.3        PSGist                                                                                                                                                  
Function        Get-GistCommit                                     1.3        PSGist                                                                                                                                                  
Function        Get-GistFork                                       1.3        PSGist                                                                                                                                                  
Function        Get-GistVersion                                    1.3        PSGist                                                                                                                                                  
Function        New-Gist                                           1.3        PSGist                                                                                                                                                  
Function        New-GistOAuthToken                                 1.3        PSGist                                                                                                                                                  
Function        Remove-Gist                                        1.3        PSGist                                                                                                                                                  
Function        Remove-GistFile                                    1.3        PSGist                                                                                                                                                  
Function        Rename-GistFile                                    1.3        PSGist                                                                                                                                                  
Function        Save-Gist                                          1.3        PSGist                                                                                                                                                  
Function        Set-Gist                                           1.3        PSGist                                                                                                                                                  
Function        Set-GistOAuthToken                                 1.3        PSGist                                                                                                                                                  
Function        Update-GistFile                                    1.3        PSGist 
```


In order to use this module, you will need to create a new GitHub API OAuth Token.  To do this, use the `New-GistOAuthToken` cmdlet.

```
New-GistOAuthToken -Credental <PSCredential> [-TokenDescription [String]]
```

This will generate a new token with access only to Gists to be used by this module.  The default name is `PSGist PowerShell Module (<ComputerName>)`, however this can be changed with the `-TokenDescription` Parameter.  
It will also create a set a new environment variable with the value, `$env:GIST_OAUTH_TOKEN`.
If you already have a token key you would like to use, you can use the `Set-GistOAuthToken` function to achieve this.
(Chances are you will not have a token value, so most likely, this function will not be used.)


Once you have authenticated, go ahead and start playing with Gist Objects!

###Update###
Most functions have been updated to include the -IseScriptPane Dynamic Parameter, this will allow you to create, add, and update file(s) in Gist objects using the content from the ISE.

Example 1:
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

---

This project is derived from my work with [Trevor Sullivan](https://github.com/pcgeek86) and [PSGitHub](https://github.com/pcgeek86/PSGitHub).  But the more I worked on it, I felt it should be its own module.  Maybe nested in PSGitHub when that is completed...