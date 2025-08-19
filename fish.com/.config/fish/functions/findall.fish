function findall -d 'find files everywhere' -a root_dir
	test -z $root_dir && set root_dir '.'
	find $root_dir 2> /dev/null | fzf -e --preview 'bat --color=always --plain {}'
end

