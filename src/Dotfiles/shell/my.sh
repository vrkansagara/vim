# @usage
# (1) copy original zshrc and inject top and bottom code
# (2) Top code
# This will be the first line of the zshrc-kali
# if [[ "$ZPROF" = true ]]; then
#   zmodload zsh/zprof
# fi
# (3) Bottom code
# Lets include into $HOME/zshrc-kali file
# Lets call my custom configuration for the shell
#source $HOME/.vim/src/Dotfiles/shell/my.sh
echo "Loading ..... $0"
export USER=$(id -un)
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
export GROUP=$(id -gn)

#### @vrkansagara @START
command_exists() {
  # @usage :- command_exists sdfsfsdfsfsd || echo " [ $1 ] command not found" && exit
  command -v "$@" >/dev/null 2>&1
  #  &&  echo " [ sudo ] command not found" && exit 0
  #  https://command-not-found.com/
}
# https://rabexc.org/posts/pitfalls-of-ssh-agents ( Be careful !!! )
# ssh-add -l &>/dev/null
# if [ "$?" == 2 ]; then
#   test -r ~/.ssh-agent && \
#     eval "$(<~/.ssh-agent)" >/dev/null

#   ssh-add -l &>/dev/null
#   if [ "$?" == 2 ]; then
#     (umask 066; ssh-agent > ~/.ssh-agent)
#     eval "$(<~/.ssh-agent)" >/dev/null
#     ssh-add
#   fi
# fi

alias g='git'
alias ss='source ~/zshrc-kali'

# force zsh to show the complete history
alias h="history 0" # review log of commands
alias o="open ."    # open current directory in the finder

#File Manager related stuff #

# Vim debug mode vim -u NONE --startuptime vim-NONE.log
alias v='vim -u NONE -N -U NONE'
alias vi='cd ~/.vim && vim'
alias viml='vim --startuptime /tmp/vim-startup.log'
alias vimDebug="vim --cmd 'profile start /tmp/vim-profiling.log' --cmd 'profile func *' --cmd 'profile file *' -c 'profdel func *' -c 'profdel file *' -c 'qa!'"

alias www='cd $HOME/www'
alias htdocs='cd $HOME/htdocs'
alias gh='cd $HOME/git'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Build related stuff"
# Build file should not have any unwanted variables.
alias makev="make --warn-undefined-variables "
alias gcc="gcc -g "
alias gdb="sudo gdb "

alias lkmLog="sudo tail -f /var/log/syslog"
alias lkmCrash="echo 'sudo /usr/bin/crash /var/crash/202110071450/dump.202110071450 /usr/lib/debug/boot/vmlinux-5.4.0-88-generic'"
alias zshCorruptHistoryRepair="mv ~/.zsh_history ~/.zsh_history_bad && strings -eS ~/.zsh_history_bad > ~/.zsh_history && fc -R ~/.zsh_history"

# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
# # bindkey -s '^r' 'history | fzf\n'
# bindkey -s '^p' 'ps -aux | fzf\n'
# bindkey -s '^h' 'htop -u $USER \n'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Angular CLI autocompletion.
# source <(ng completion script)

# Let's rust do it's own
# [ -f $HOME/.cargo/env ] && source "$HOME/.cargo/env"

prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		prompt_segment white default "%(!.%{%F{yellow}%}.)$USER"
	fi
}

# CUSTOM FROM HERE....
source "$HOME/.vim/src/Dotfiles/shell/bash_color.sh"
source "$HOME/.vim/src/Dotfiles/shell/bash_functions.sh"
#source "$HOME/.vim/src/Dotfiles/shell/svn_aliases.sh"
source "$HOME/.vim/src/Dotfiles/shell/administrator_aliases.sh"
source "$HOME/.vim/src/Dotfiles/shell/docker_aliases.sh"
source "$HOME/.vim/src/Dotfiles/shell/aws_aliases.sh"
source "$HOME/.vim/src/Dotfiles/shell/php_aliases.sh"

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	# change suggestion color
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
	. /etc/zsh_command_not_found
fi

## Original vrkansagara start from bellow
# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)

# Enable colors and change prompt:
# autoload -U colors && colors  # Load colors
setopt autocd # Automatically cd into typed directory.
# stty stop undef       # Disable ctrl-s to freeze terminal.
# setopt interactive_comments

COMPOSER_PROCESS_TIMEOUT=5000

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HOME/.vim/data/cache/zsh

## VIM plugines debug
export NVIM_COC_LOG_LEVEL=debug
export NVIM_COC_LOG_FILE="/tmp/coc-nvim.log"

# Used for the phpStorm program and java application to work with DWM
export _JAVA_AWT_WM_NONREPARENTING=1 # If you come from bash you might have to change your $PATH.
export AWT_TOOLKIT=MToolkit
# wmname LG3D

# export DISPLAY=:0
# Yes,I use st( Terminal base would be xterm (to avoide VIM and Remote SSH X )
export TERM=xterm
# Remote sessin would be xterm base (Avoide st-256 issue at remote)
alias ssh='env TERM=xterm ssh'
alias sshOld='env TERM=xterm ssh -oHostKeyAlgorithms=+ssh-dss '

export GPG_TTY=$(tty)

# If you come from bash you might have to change your $PATH.
export PATH="$(getconf PATH)" # reset system default
export PATH="$HOME/.vim/bin:$HOME/.vim/vendor/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.vim/node_modules/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# BEGIN SNIPPET: Magento Cloud CLI configuration
HOME=${HOME:-"/home/$USER"}
export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi
# END SNIPPET

# zsh-completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
	# chmod go-w '/opt/homebrew/share'
	# chmod -R go-w '/opt/homebrew/share/zsh'
fi

# gem install --user-install docker-sync
export GEM_HOME="$HOME/.gem"

#PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt} %{$fg[yellow]%}[%D{%f/%m/%Y} %D{%T}] [ हरि ऊँ तत् सत्  ]
PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt} %{$fg[yellow]%}[%D{%f/%m/%Y} %D{%T}] [ Do one thing at a time and do it well ]
╰─%B[卐]%b "
RPROMPT="%B${return_code}%b"

# Alwayse load profile at the last because user preference can be overriden to the existing function or variables
if [ -f "$HOME/.profile" ]; then
  echo "Loading ..... $HOME/.profile , User specific profile settings .."
	. $HOME/.profile
fi


# This must be the last line of $HOME/zshrc-kali because From bash_functions.sh@profzsh will call for the profiling
if [[ "$ZPROF" = true ]]; then
	zprof
fi
