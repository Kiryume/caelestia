function set_tmux_window_name --on-event fish_prompt
    # 1. Only run if inside a tmux session
    if not set -q TMUX
        return
    end

    # 2. Setup Base and Context
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
    set -l base_label
    set -l relative_path
    set -l is_git 0

    if test -n "$git_root"
        # --- Git Context ---
        set is_git 1
        set base_label (basename $git_root)
        set relative_path (string replace --regex "^$git_root/?" "" $PWD)
    else
        # --- Non-Git Context ---
        if string match -q "$HOME*" $PWD
            set base_label "~"
            set relative_path (string replace --regex "^$HOME/?" "" $PWD)
        else
            set base_label "/"
            set relative_path (string replace --regex "^/?" "" $PWD)
        end
    end

    # 3. Process the Path Components
    set -l parts (string split "/" --no-empty $relative_path)
    set -l processed_parts
    set -l count_parts (count $parts)

    for i in (seq $count_parts)
        set -l part $parts[$i]
        
        # Rule: If we are NOT in git, and this is the LAST part, keep full name.
        if test $is_git -eq 0 -a $i -eq $count_parts
            set -a processed_parts $part
        else
            # Otherwise, shorten it
            if string match -q ".*" $part
                # Dotfiles: keep dot + 1 char (e.g., .config -> .c)
                set -a processed_parts (string sub -l 2 $part)
            else
                # Normal: keep 1 char (e.g., Documents -> D)
                set -a processed_parts (string sub -l 1 $part)
            end
        end
    end

    # 4. Construct Final Name
    set -l path_suffix (string join "/" $processed_parts)
    set -l window_name

    if test -n "$path_suffix"
        set window_name "$base_label/$path_suffix"
    else
        # We are exactly at the base (Home or Git Root)
        set window_name "$base_label"
    end

    # 5. Append " git" suffix if inside a repo
    if test $is_git -eq 1
        set window_name "$window_name "
    end

    tmux rename-window "$window_name"
end
