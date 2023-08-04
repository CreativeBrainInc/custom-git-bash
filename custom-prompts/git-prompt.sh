#       When executing interactively, bash displays the primary prompt PS1 when it is ready to read a command, 
# 			and the secondary prompt PS2 when it needs more input to complete a command. 
#				Bash allows these prompt strings to be cus­tomized by inserting a number of backslash-escaped special 
#				characters that are decoded as follows:
#              \a     an ASCII bell character (07)
#              \d     the date in "Weekday Month Date" format (e.g., "Tue May 26")
#              \e     an ASCII escape character (033)
#              \h     the hostname up to the first `.'
#              \H     the hostname
#              \j     the  number of jobs currently managed by the shell
#              \l     the basename of the shell's terminal device name
#              \n     newline
#              \r     carriage return
#              \s     the name of the shell, the basename of $0 (the portion following the final slash)
#              \t     the current time in 24-hour HH:MM:SS format
#              \T     the current time in 12-hour HH:MM:SS format
#              \@     the current time in 12-hour am/pm format
#              \u     the username of the current user
#              \v     the version of bash (e.g., 2.00)
#              \V     the release of bash, version + patchlevel (e.g., 2.00.0)
#              \w     the current working directory
#              \W     the  basename  of the current working direc­tory
#              \!     the history number of this command
#              \#     the command number of this command
#              \$     if the effective UID is 0, a #, otherwise a $
#              \nnn   the character corresponding to the octal number nnn
#              \\     a backslash
#              \[     begin a sequence of non-printing characters, 
#											which could be used to embed a terminal con­trol sequence into the prompt
#              \]     end a sequence of non-printing characters



# Custom prompt settings
PROMPT_DIRTRIM=4                         # Shorten deep paths in the prompt
PS1='\[\033]0;Git | Bash v\v | \W\007\]' # set window title
PS1="$PS1"'\n'                           # new line
PS1="$PS1"'\[\033[30;45m\] [\A] '        # black text, magenta, 24h time
PS1="$PS1"'\[\033[30;42m\] \u '          # black text, green, user
#PS1="$PS1"'\[\033[30;42m\]@\h '         # black text, green, @host
# PS1="$PS1"'\[\033[30;43m\] \w '        # black text, yellow, working director
PS1="$PS1"'\[\e[30;43m\] <\W> '					 # insert current working directory
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[97;46m\]'  # white text, cyan
        PS1="$PS1"'`__git_ps1`'      # bash function
    fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $

# Git status options
# Shows * or + for unstaged and staged changes, respectively.
export GIT_PS1_SHOWSTASHSTATE=true

# shows $ if there are any stashes.
export GIT_PS1_SHOWDIRTYSTATE=true

# Shows % if there are any untracked files.
export GIT_PS1_SHOWUNTRACKEDFILES=true

# shows <, >, <>, or = when your branch is behind, ahead, diverged from,
# or in sync with the upstream branch, respectively.
export GIT_PS1_SHOWUPSTREAM="auto"