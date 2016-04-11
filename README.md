# PSGist
## A PowerShell module to interact with GitHub Gists.

This is a PowerShell module that uses the GitHub API to interact and manipulate [Gist](https://developer.github.com).


```
PS C:\> Get-Command -Module PSGist

CommandType     Name                                               Version    Source                                                                                                                                    
-----------     ----                                               -------    ------                                                                                                                                    
Alias           Fork-Gist                                          1.0        PSGist                                                                                                                                    
Function        Copy-Gist                                          1.0        PSGist                                                                                                                                    
Function        Get-Gist                                           1.0        PSGist                                                                                                                                    
Function        Get-GistCommit                                     1.0        PSGist                                                                                                                                    
Function        Get-GistFork                                       1.0        PSGist                                                                                                                                    
Function        New-Gist                                           1.0        PSGist                                                                                                                                    
Function        New-GistOAuthToken                                 1.0        PSGist                                                                                                                                    
Function        Remove-Gist                                        1.0        PSGist                                                                                                                                    
Function        Save-Gist                                          1.0        PSGist                                                                                                                                    
Function        Set-Gist                                           1.0        PSGist                                                                                                                                    
Function        Set-GistOAuthToken                                 1.0        PSGist   
```


In order to use this module, you will need to create a new GitHub API OAuth Token.  To do this, use the `New-GistOAuthToken` cmdlet.

```
New-GistOAuthToken -Credental <PSCredential> [-TokenDescription [String]]
```

This will generate a new token with access only to Gists to be used by this module.  The default name is 'PSGist PowerShell Module (<ComputerName>)', however this can be changed with the `-TokenDescriptionParameter`.  
It will also create a set a new envrionment variable with the value, `$env:GIST_OAUTH_TOKEN`.
If you already have a token key you would like to use, you can use the `Set-GistOAuthToken` function to achieve this.


Once you have authenticated, go ahead and start playing with Gists!

Example 1:
```
PS C:\> Get-Gist | Select-Object -First 1


Comments    : 0
CommentsUrl : https://api.github.com/gists/62f8f608bdfec5d08552/comments
CommitsUrl  : https://api.github.com/gists/62f8f608bdfec5d08552/commits
CreatedAt   : 3/16/2016 10:39:29 AM
Description : Fix for missing Sophos Web Intelligence Service
Files       : {Register-SophosWebIntelligenceService.ps1}
Forks       : 
ForksUrl    : https://api.github.com/gists/62f8f608bdfec5d08552/forks
History     : 
HtmlUrl     : https://gist.github.com/62f8f608bdfec5d08552
Id          : 62f8f608bdfec5d08552
Owner       : GistUser
Public      : True
PullUrl     : https://gist.github.com/62f8f608bdfec5d08552.git
PushUrl     : https://gist.github.com/62f8f608bdfec5d08552.git
Truncated   : False
UpdatedAt   : 3/16/2016 10:40:08 AM
Url         : https://api.github.com/gists/62f8f608bdfec5d08552
```

Example 2:
```
PS C:\> Get-Gist | Select -First 1 | Save-Gist


    Directory: C:\Users\dotps1\AppData\Roaming\PSGist\62f8f608bdfec5d08552


Mode                LastWriteTime         Length Name                                                                                                                                                                   
----                -------------         ------ ----                                                                                                                                                                   
-a----        4/11/2016  12:32 PM           2080 Register-SophosWebIntelligenceService.ps1         
```

If you are in the ISE and want to quickly create a new Gist:
```
New-Gist -IseScriptPane
```
This will create a new Gist with whatever content is active in the ISE, and name the file, whatever the tab is currently labeled.  Use the -Public switch if you would like it public to the world.

---

This project is derived from my work with [Trevor Sullivan](https://github.com/pcgeek86) and [PSGitHub](https://github.com/pcgeek86/PSGitHub).  But the more I worked on it, I felt it should be its own module.  Maybe nested in PSGitHub when that is completed.