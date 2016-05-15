---
external help file: PSGist.psm1-help.xml
schema: 2.0.0
---

# New-Gist
## SYNOPSIS
{{Fill the Synopsis}}

## SYNTAX

### Path
```
New-Gist -Path <String[]> [-Description <String>] [-Public] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### IseScriptPane
```
New-Gist [-Description <String>] [-Public] [-WhatIf] [-Confirm] [-IseScriptPane] [-FileName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
{{Fill the Description}}

## EXAMPLES

## PARAMETERS

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

### Description
Description of the Gist Object.

```yaml
Type: String
Parameter Sets: Path, IseScriptPane
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### Public
Allows the Gist Object to be viewed by others.

```yaml
Type: SwitchParameter
Parameter Sets: Path, IseScriptPane
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### WhatIf
{{Fill WhatIf Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Path, IseScriptPane
Aliases: wi

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### Confirm
{{Fill Confirm Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Path, IseScriptPane
Aliases: cf

Required: False
Position: Named
Default value: 
Accept pipeline input: False
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
The name of the Gist file.

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


