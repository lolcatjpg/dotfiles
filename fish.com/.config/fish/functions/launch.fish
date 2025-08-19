function launch -d 'launch program'
    $argv &> /dev/null & disown
end
