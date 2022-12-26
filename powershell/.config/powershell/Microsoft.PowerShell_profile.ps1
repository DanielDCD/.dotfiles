# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineOption -PredictionSource History

# Aliases
Set-Alias -Name c -Value cls

Set-Alias -Name la -Value Get-ChildItem
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name lla -Value Get-ChildItem

Set-Alias -Name vi -Value nvim

Set-Alias -Name cat -Value bat

# Starship prompt
Invoke-Expression (&starship init powershell)

