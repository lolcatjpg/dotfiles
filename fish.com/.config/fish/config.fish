if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting "
          .            
    \_____)\_____
    /--v____ __`<         
            )/           
            '"
end

thefuck --alias | source
zoxide init fish | source
