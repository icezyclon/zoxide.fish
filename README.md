# zoxide.fish

> Tab completion and initialization for [zoxide](https://github.com/ajeetdsouza/zoxide) in [fish shell](https://fishshell.com/).

[Zoxide](https://github.com/ajeetdsouza/zoxide) is a *smarter cd command* and can be used as a *direct replacement* for cd in the shell.
Once sourced by this plugin it provides the **z** command to navigate between directories, which also *replaces the default cd command*.

This plugin provides tab completion for **z** which does *first* complete directories and *then* zoxide queries, if no directories match the given string. It also allows for multiple search words for zoxide queries, using the last valid path for entering directories.

**zi** may be used for interactive selection of recently visited directories.

After installation the cd command will be aliased to **z** by default.
> In case this is not desired `_zoxide_uninstall` may be called in `config.fish` after the plugin was initialized to restore the old cd and keep **z** as a separate function.

## Examples

```bash
# given the following zoxide database
zoxide query -sl
    25 /home/user/test/foo
    20 /home/user/test/bar
    10 /home/user/foo/baz/bar

# we start in home with folders foo and test
> /home/user
cd <TAB>
foo test  <-- folder completion

cd te<TAB>
cd test  <-- folder completion, single choice

cd bar<TAB>
/home/user/test/bar /home/user/foo/baz/bar  <-- zoxide completion

cd baz<TAB>
cd /home/user/foo/baz/bar  <-- zoxide completion, single choice

# multi-word zoxide completion, uses 'bar' AND 'baz' for search
cd bar baz<TAB>
cd bar /home/user/foo/baz/bar<ENTER>  <-- zoxide completion, single choice
# enter last argument if it is directory, ignoring the 'bar' used for searching
> /home/user/foo/baz/bar

# empty cd returns to HOME
cd<ENTER>
> /home/user

# if TAB is not used to complete a directory name, then zoxide first result is used instead
cd te<ENTER>  <-- 'te' is not directory, use zoxide best match for 'te'
> /home/user/test/foo

# dash enters the last visited directory (in this case HOME)
cd -<ENTER>
> /home/user

cd bar baz<ENTER>  <-- 'baz' not directory, use zoxide best match for 'bar' AND 'baz'
> /home/user/foo/baz/bar

# interactive search
zi<ENTER>
```

## Requirements

This plugin requires that [zoxide](https://github.com/ajeetdsouza/zoxide) is installed and in the path.

On Ubuntu and other Debian systems, **zoxide** may be installed with apt:

```console
sudo apt install zoxide
```

## Versions

Because [zoxide](https://github.com/ajeetdsouza/zoxide) changes the the init script based on the version, and especially because the apt version of **zoxide** is still very old, this plugin does *not* source `zoxide init fish`.
It instead provides modified copies of the required functions from **zoxide** version 0.8.1 with custom tab completion.

> This plugin was written for [fish version 3.5.0](https://fishshell.com/docs/3.5/), there is no guarantee that it will work for older versions of fish.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install icezyclon/zoxide.fish 
```

The default behavior for tab completion may change.
To get the same stable version of the behavior install from a certain tag instead, e.g.

```console
fisher install icezyclon/zoxide.fish@3.0
```

## Related Plugins

* [z plugin](https://github.com/jethrokuan/z) - a port of [rupa/z](https://github.com/rupa/z).
This version of z is *not* a direct replacement of cd as it *only* provides the directory tracking and queries capabilities.
Furthermore, the [z plugin](https://github.com/jethrokuan/z) is not affiliated to [zoxide](https://github.com/ajeetdsouza/zoxide).

* [omf-autojump](https://github.com/rominf/omf-plugin-autojump) and [omf-fzf-autojump](https://github.com/rominf/omf-plugin-fzf-autojump) are [autojump](https://github.com/wting/autojump) plugins for [oh-my-fish](https://github.com/oh-my-fish), as an alternative to [zoxide](https://github.com/ajeetdsouza/zoxide).

## License

[MIT](LICENSE)