if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting "
$(set_color blue)          .            
    \_____)\_____
    /--v$(set_color white)____ __$(set_color ffaacc)⸜$(set_color white)˙
$(set_color blue)            )/           
            '"
end

thefuck --alias | source
zoxide init fish | source
