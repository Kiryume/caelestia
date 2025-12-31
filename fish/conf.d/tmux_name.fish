function set_tmux_window_name --on-event fish_prompt
    # Only run if inside a tmux session
    if not set -q TMUX
        return
    end

    # Check if inside a git repository
    # stderr indicates not a git repo, so we send it to /dev/null
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)

    if test -n "$git_root"
        # If in a repo, use the repo name (basename of the root path)
        set -l repo_name (basename $git_root)
        tmux rename-window "$repo_name "
    else
        # Otherwise, use the current folder name
        set -l dir_name (basename $PWD)
        tmux rename-window "$dir_name"
    end
end
