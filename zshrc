source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle brew
antigen bundle colored-man
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme avit

antigen apply

export EDITOR="vi"
export CLICOLOR=1

alias ls="ls -lhG"
