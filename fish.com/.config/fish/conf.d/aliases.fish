if status is-interactive
    alias vi '$EDITOR'
    alias ll "lsd -AlgF --group-directories-first"
    alias l "lsd -gF"
    alias cat "bat -p"
    alias man "batman"
    alias fccopy "fish_clipboard_copy"
    alias fcpaste "fish_clipboard_paste"
    alias reload "exec fish"

    alias config "git --git-dir=$HOME/dotfiles/.git/ --work-tree=$HOME/dotfiles/"
    abbr -a confaa "config add -A"
    abbr -a confst "config status"
    abbr -a --set-cursor confcm "config commit -m '%'"
    abbr -a confpsh "config push"

    abbr -a gaa "git add -A"
    abbr -a gst "git status"
    abbr -a gpsh "git push"
    abbr -a --set-cursor gcm "git commit -m '%'"
    abbr -a --set-cursor gcam "git commit -am '%'"
end
    
