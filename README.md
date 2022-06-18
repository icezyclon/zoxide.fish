# zoxide.fish

> Tab completion and initialization for [zoxide](https://github.com/ajeetdsouza/zoxide) in [fish shell](https://fishshell.com/).

Zoxide is a *smarter cd command* and can be used as a *direct replacement* for cd in the shell.
Once sourced by this plugin it provides the **z** command to navigate between directories.
**z** may be used as a *drop in replacement* for cd.

By default, tab completion for **z** does *first* complete directories and *then* zoxide queries, if no directories match the given string.

**zi** may be used for interactive selection of recently visited directories.

After installation **z** may be used instead of cd like so 

```fish
abbr cd z
```

## Requirements

This plugin requires that [zoxide](https://github.com/ajeetdsouza/zoxide) is installed and in the path.

On Ubuntu and other Debian systems, **zoxide** may be installed with apt:

```console
sudo apt install zoxide
```

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

## License

MIT. See the [LICENSE](LICENSE) for details.