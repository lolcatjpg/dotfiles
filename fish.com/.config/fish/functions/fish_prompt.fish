function fish_prompt --description 'Write out the prompt'
	#
	# based on astronaut prompt, with a few additions (marked with 'custom')
	# 

    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

	# git (custom)
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream 'auto'
    #set -g __fish_git_prompt_showcolorhints 1
    #set -g __fish_git_prompt_color_untrackedfiles yellow
    set -g __fish_git_prompt_char_untrackedfiles '? '
    #set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_char_invalidstate '! '
    #set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_char_dirtystate '* '
    set -g __fish_git_prompt_char_stagedstate '+ '
    #set -g __fish_git_prompt_color_cleanstate green
    set -g __fish_git_prompt_char_cleanstate ' ='
    set -g __fish_git_prompt_char_upstream_ahead '⇡'
    set -g __fish_git_prompt_char_upstream_behind '⇣'

    # Color the prompt differently when we're root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end


	echo  # add newline (custom)
	fish_default_mode_prompt | tr -d '\n'  # custon
    echo -s (prompt_login) ' ' $cwd_color (prompt_pwd) $vcs_color (fish_vcs_prompt) $normal ' ' $prompt_status
    echo -n -s $status_color $suffix ' ' $normal
end
