function _zoxide_z_complete -d "Complete directory first or zoxide queries otherwise" --argument-names comp desc
    # most of this functions is compied from __fish_complete_directories with a small tweak

    # comp is the currently completing token
    if not set -q comp[1]
        set comp (commandline -ct)
    end
    # cmd are all tokens including the current one except the command
    set -l cmd (commandline -opc) $comp
    set -e cmd[1]

    if test "$comp" = "$cmd"
        # if we are on our first token, then allow file complete
        # otherwise use zoxide (for multi word zoxide query)

        # HACK: We call into the file completions by using a non-existent command.
        # If we used e.g. `ls`, we'd run the risk of completing its options or another kind of argument.
        # But since we default to file completions, if something doesn't have another completion...
        set -f dirs (complete -C"nonexistentcommandooheehoohaahaahdingdongwallawallabingbang $comp" | string match -r '.*/$')
    end

    # in the future: replace entire cmd with tab complete instead of only last token
    # at the moment: is handled in z function to always enter last token if directory

    if set -q dirs[1]
        # if we find any files to complete use those
        printf "%s\t$desc\n" $dirs
    else
        # otherwise use zoxide
        zoxide query -l $cmd
    end
end

function _zoxide_equals_first_token -a check -d "Test if first non-switch token equals given one"
    set -l tokens (commandline -co)
    set -e tokens[1]
    set -l tokens (string replace -r --filter '^([^-].*)' '$1' -- $tokens)
    if set -q tokens[1]
        test $tokens[1] = $check
    else
        return 1
    end
end
