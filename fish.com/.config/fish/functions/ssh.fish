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
    --preview 'rg --multiline -i \'^Host {}(\\n(\\t+| +).*)+\' .ssh/hosts' \
    --preview-window right,border-left,wrap

function _ssh_search
    set host (sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/hosts | $FZF_COMMAND)
    test (count $host) -eq 0 && return
    echo -s (set_color brwhite) 'ssh to ' (set_color normal) $host
    /usr/bin/env ssh $host
end
