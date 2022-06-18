function _zoxide_z_complete -d "Complete directory first or zoxide queries otherwise" --argument-names comp desc
    # most of this functions is compied from __fish_complete_directories with a small tweak

    if not set -q comp[1]
        set comp (commandline -ct)
    end

    # HACK: We call into the file completions by using a non-existent command.
    # If we used e.g. `ls`, we'd run the risk of completing its options or another kind of argument.
    # But since we default to file completions, if something doesn't have another completion...
    set -l dirs (complete -C"nonexistentcommandooheehoohaahaahdingdongwallawallabingbang $comp" | string match -r '.*/$')

    if set -q dirs[1]
        printf "%s\t$desc\n" $dirs
    else
        zoxide query -l
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
