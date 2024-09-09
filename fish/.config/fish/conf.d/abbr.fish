if status is-interactive

    abbr --add c clear
    abbr --add cls clear

    if type -q eza
        abbr --add ls "eza --icons"
        abbr --add ll "eza -l --icons"
        abbr --add la "eza -a --icons"
        abbr --add lla "eza -al --icons"
        abbr --add tree "eza -T --icons"
    else
        abbr --add ll "ls -l"
        abbr --add la "ls -a"
        abbr --add lla "ls -la"
    end

    if type -q bat
        abbr --add cat "bat"
   end

    if type -q nvim
        abbr --add vi "nvim"
    end

    if type -q rg
        abbr --add grep "rg"
    end
end
