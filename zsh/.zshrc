#custom aliases
alias ll='ls -lh --group-directories-first'

## Include _ as part of words
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# history configs
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

## Shell only exists after the 10th consecutive Ctrl-d
setopt ignore_eof

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

## more keys for easier editing
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
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

# Conda functions
function conda_activate() {
    ENV_NAME="$1"
    USER=whoami
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
