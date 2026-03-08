# shows a search dialog for ssh hosts when ssh is called without arguments

function ssh --wraps=ssh
    if test (count $argv) -eq 0
        _ssh_search
    else
        /usr/bin/env ssh $argv
    end
end

set FZF_COMMAND fzf \
    --border sharp \
    --height 15 \
    --info inline \
    --layout reverse \
    --prompt 'search host > ' \
    --preview 'rg --multiline -i \'^Host {}(\\n(\\t+| +).*)+\' $HOME/.ssh/hosts | bat -pl ssh_config --color always' \
    --preview-window right,border-left,wrap \
    --bind 'enter:become(echo -n ssh {})' \
    --bind 'alt-enter:become(echo -n mosh {})' \
    --footer 'enter: connect | alt+enter: connect with mosh'

function _ssh_search
    sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/hosts | $FZF_COMMAND | read connect_cmd host
    test (count $host) -eq 0 && return
    echo -s (set_color brwhite) $connect_cmd ' to ' (set_color normal) $host
    /usr/bin/env $connect_cmd $host
end
