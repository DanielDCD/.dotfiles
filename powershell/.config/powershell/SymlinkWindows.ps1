New-Item -ItemType HardLink -Path "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$PWD\Microsoft.PowerShell_profile.ps1"

New-Item -ItemType HardLink -Path "$HOME\.config\starship.toml" -Target "$HOME\.dotfiles\starship\.config\starship.toml"

