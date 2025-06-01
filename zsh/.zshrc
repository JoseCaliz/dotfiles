# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#custom aliases
alias ll='ls -lh --group-directories-first'

# Wandb
export wandb_key='6809ce0857ddfc06ed99accd93269244305ad38e'

# CUDA
export PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export TELEGRAM_TOKEN='6196947006:AAFweeHhrpKpjSNCON2RcDCURuBunftEF_o'

# history configs
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

# HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.
# END HISTORY

## Include _ as part of words
export WORDCHARS='*?_[]~=&;!#$%^(){}'

## Shell only exists after the 10th consecutive Ctrl-d
setopt ignore_eof

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/home/josecaliz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/josecaliz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/josecaliz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/josecaliz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

function conda_activate() {
    ENV_NAME="$1"
    USER=`whoami`
    conda activate $ENV_NAME || return 1
    alias pip='/home/${USER}/miniconda3/envs/${ENV_NAME}/bin/pip'
    alias pip3='/home/${USER}/miniconda3/envs/${ENV_NAME}/bin/pip3'
    alias ipython='/home/${USER}/miniconda3/envs/${ENV_NAME}/bin/ipython'
    alias python='/home/${USER}/miniconda3/envs/${ENV_NAME}/bin/python'
}

function conda_deactivate() {
    conda deactivate;
    conda deactivate;
    unalias pip
    unalias ipython
    unalias python
}

alias ca="conda_activate"
alias cde="conda_deactivate"

## more keys for easier editing
bindkey "^e" beginning-of-line
bindkey "^a" end-of-line
bindkey "^h" backward-word
bindkey "^l" forward-word
bindkey "^f" history-incremental-search-forward
bindkey "^r" history-incremental-search-backward
bindkey "^g" send-break
bindkey "^n" down-history
bindkey "^p" up-history
bindkey "^u" undo
bindkey "^w" backward-kill-word
bindkey "^d" kill-word
bindkey "^s" delete-char
bindkey "^t" backward-delete-char
stty intr ^G

# Created by `pipx` on 2025-05-20 16:54:10
export PATH="$PATH:/home/josecaliz/.local/bin"
