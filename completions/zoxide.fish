set -l commands add help import init query remove

# disable normal all-files completion
complete -c zoxide -f

# onyl show base options if none was used already
complete -c zoxide -n __fish_use_subcommand -a add -d "Add a new directory or increment its rank"
complete -c zoxide -n __fish_use_subcommand -a help -d "Prints this message or the help of the given subcommand(s)"
complete -c zoxide -n __fish_use_subcommand -a import -d "Import from z database"
complete -c zoxide -n __fish_use_subcommand -a init -d "Generates shell configuration"
complete -c zoxide -n __fish_use_subcommand -a query -d "Search for a directory"
complete -c zoxide -n __fish_use_subcommand -a remove -d "Remove a directory"

# zoxide add
complete -c zoxide -n "_zoxide_equals_first_token add" -n "__fish_is_nth_token 2" -a "(__fish_complete_directories)"

# zoxide help
complete -c zoxide -n "_zoxide_equals_first_token help" -n "__fish_is_nth_token 2" -a "$commands"

# zoxide import
complete -c zoxide -r -F -n "_zoxide_equals_first_token import" -n "__fish_is_nth_token 2"
complete -c zoxide -r -n "_zoxide_equals_first_token import" -l merge -d "Merge entries into existing database"

# zoxide init
set -l initshells bash fish posix powershell zsh
complete -c zoxide -n "_zoxide_equals_first_token init" -n "__fish_is_nth_token 2" -a "$initshells"
complete -c zoxide -n "_zoxide_equals_first_token init" -l cmd -d "Renames the 'z' command and corresponding aliases [default: z]"
complete -c zoxide -n "_zoxide_equals_first_token init" -l hook -a "none prompt pwd" -d "Chooses event on which an entry is added to the database [default: pwd]"
complete -c zoxide -n "_zoxide_equals_first_token init" -l no-aliases -d "Prevents zoxide from defining any commands other than 'z'"

# zoxide query
complete -c zoxide -r -n "_zoxide_equals_first_token query" -s i -l interactive -d "Opens an interactive selection menu using fzf"
complete -c zoxide -r -n "_zoxide_equals_first_token query" -s l -l list -d "List all matching directories"
complete -c zoxide -r -n "_zoxide_equals_first_token query" -s s -l score -d "Display score along with result"

# zoxide remove
complete -c zoxide -n "_zoxide_equals_first_token remove" -n "__fish_is_nth_token 2" -a "(zoxide query -l)"

# Always possible
complete -c zoxide -x -s h -l help -d "Prints help information"
complete -c zoxide -x -s V -l version -d "Prints version information"
