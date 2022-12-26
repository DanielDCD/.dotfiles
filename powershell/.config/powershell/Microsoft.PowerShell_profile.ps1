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

function take {

    param (
        $name
    )

    New-Item -Type Directory -Path $name > $null
    Set-Location $name

}

# Zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Starship prompt
Invoke-Expression (&starship init powershell)

