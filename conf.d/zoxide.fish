set -g _zoxide_msg_promt (string replace " " "" "[$(set_color brcyan)plugin$(set_color normal):$(set_color green)zoxide$(set_color normal)]")

if status is-interactive

    if type -q zoxide
        zoxide init fish | source

        complete -c z -f
        complete -c z -n __fish_use_subcommand -x -a '(_zoxide_z_complete)'
    else
        echo $_zoxide_msg_promt "Command 'zoxide' cannot be found. Not installed or not in path"
    end

end

function _zoxide_install --on-event zoxide_install
    if status is-interactive
        switch (read --prompt-str="$_zoxide_msg_promt Abbreviate cd to z? [Y/n] " | string lower)
            case y ye yes ''
                echo "$_zoxide_msg_promt Adding" (echo -ns "abbr cd z" | fish_indent --ansi)
                abbr -a -U cd z
            case '*'
                echo "$_zoxide_msg_promt Note: Type" (echo -ns "abbr cd z" | fish_indent --ansi) "to abbreviate cd to z"
        end
    end
end

function _zoxide_uninstall --on-event zoxide_uninstall
    if abbr -q cd && abbr -s | grep "\-\- cd z" >/dev/null
        abbr -e cd
        echo "$_zoxide_msg_promt Removing" (echo -ns "abbr cd z" | fish_indent --ansi)
    end
end
