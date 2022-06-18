# zoxide.fish

> Tab completion and initialization for [zoxide](https://github.com/ajeetdsouza/zoxide) in [fish shell](https://fishshell.com/).

[Zoxide](https://github.com/ajeetdsouza/zoxide) is a *smarter cd command* and can be used as a *direct replacement* for cd in the shell.
Once sourced by this plugin it provides the **z** command to navigate between directories.
**z** may be used as a *drop in replacement* for cd.

By default, tab completion for **z** does *first* complete directories and *then* zoxide queries, if no directories match the given string.

**zi** may be used for interactive selection of recently visited directories.

After installation cd may be used as an abbreviation for **z** like so:

```fish
abbr cd z
```

This leaves the normal cd command unchanged for scripts but replaced cd with z during normal interactive shell usage.

## Requirements

This plugin requires that [zoxide](https://github.com/ajeetdsouza/zoxide) is installed and in the path.

On Ubuntu and other Debian systems, **zoxide** may be installed with apt:

```console
sudo apt install zoxide
```

> This plugin was written for [fish version 3.5.0](https://fishshell.com/docs/3.5/), there is no guarantee that it will work for older versions of fish.

> The plugin sources `zoxide init fish`, which was tested for the apt version `0.4.3-2` only.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install icezyclon/zoxide.fish 
```

The default behavior for tab completion may change.
To get the same stable version of the behavior install from a certain tag instead, e.g.

```console
fisher install icezyclon/zoxide.fish@1.0
```

## Related Plugins

* [z plugin](https://github.com/jethrokuan/z) - a port of [rupa/z](https://github.com/rupa/z).
This version of z is *not* a direct replacement of cd as it *only* provides the directory tracking and queries capabilities.
Furthermore, the [z plugin](https://github.com/jethrokuan/z) is not affiliated to [zoxide](https://github.com/ajeetdsouza/zoxide).

* [omf-autojump](https://github.com/rominf/omf-plugin-autojump) and [omf-fzf-autojump](https://github.com/rominf/omf-plugin-fzf-autojump) are [autojump](https://github.com/wting/autojump) plugins for [oh-my-fish](https://github.com/oh-my-fish), as an alternative to [zoxide](https://github.com/ajeetdsouza/zoxide).

## License

[MIT](LICENSE)