---
external help file: PSGist.psm1-help.xml
schema: 2.0.0
---

# Add-GistFile
## SYNOPSIS
{{Fill the Synopsis}}

## SYNTAX

### Path
```
Add-GistFile -Id <String> -Path <String[]> [<CommonParameters>]
```

### IseScriptPane
```
Add-GistFile -Id <String> [-IseScriptPane] [-FileName <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill the Description}}

## EXAMPLES

## PARAMETERS

### Id
The Id of the Gist Object.

```yaml
Type: String
Parameter Sets: Path, IseScriptPane
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### Path
Path to file\(s\) where the content will be used for the GistFile.

```yaml
Type: String[]
Parameter Sets: Path
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### IseScriptPane
Captures the current active ISE Script Pane for the GistFile content.

```yaml
Type: SwitchParameter
Parameter Sets: IseScriptPane
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### FileName
The name of the GistFile.

```yaml
Type: String
Parameter Sets: IseScriptPane
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


