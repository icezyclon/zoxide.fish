if status is-interactive

    if type -q zoxide

        # -------------
        # 'zoxide init fish' is very different for different versions of zoxide
        # to guarantee the same behavior we define these functions ourself,
        # especially because the apt package is so old
        # most of these functions were taken from https://github.com/ajeetdsouza/zoxide
        # from version 0.8.1

        if ! builtin functions -q _zoxide_cd
            if builtin functions -q cd
                builtin functions -c cd _zoxide_cd
            else
                alias _zoxide_cd='builtin cd'
            end
        end

        function _zoxide_hook --on-variable PWD
            test -z "$fish_private_mode"
            and command zoxide add -- (builtin pwd -L)
        end

        function z
            set argc (count $argv)
            if test $argc -eq 0
                _zoxide_cd $HOME
            else if test "$argv" = -
                _zoxide_cd -
            else if test -d $argv[-1]
                _zoxide_cd $argv[-1]
            else
                set -l result (command zoxide query $argv)
                and _zoxide_cd $result
            end
        end

        function zi
            set -l result (command zoxide query -i -- $argv)
            and _zoxide_cd $result
        end

        # -------------

        alias cd=z

        # use custom completion
        complete -c z -f # disable files by default 
        complete -c z -x -a '(_zoxide_z_complete)'
    else
        echo "[plugin: zoxide] Command 'zoxide' cannot be found. Not installed or not in path"
    end

end

function _zoxide_uninstall --on-event zoxide_uninstall
    if alias | grep "alias cd z" >/dev/null
        functions -e cd
    end
    if builtin functions -q _zoxide_cd && not functions -q cd
        # restore old cd
        builtin functions -c _zoxide_cd cd
    end
end
