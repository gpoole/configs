# Path to your oh-my-zsh installation.
export ZSH=/Users/greg.poole/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime wd brew colored-man npm sudo osx yarn hub zsh-autosuggestions autojump)

# User configuration
export STACK_INSTALL_PATH="/Users/greg.poole/.local/bin"
MYD_SCRIPTS="/Users/greg.poole/Projects/fe-myd-scripts"
MYD_MONO_SCRIPTS="$HOME/Projects/fe-myd-mono/scripts"
YARN_PATH="$HOME/.yarn/bin"
export PATH="$MYD_MONO_SCRIPTS:$YARN_PATH:/Users/greg.poole/Scripts:$STACK_INSTALL_PATH:$MYD_SCRIPTS:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export CLICOLOR=1
export NVM_DIR="/Users/greg.poole/.nvm"
export PYTHONPATH='/Library/Python/2.7/site-packages'
# export MANPATH="/usr/local/man:$MANPATH"
. ~/.zshrc_secrets
# export EDITOR="atom"
export EDITOR="vi"

# Hack to add rinku for testing
export RINKU_ROOT="$HOME/Projects/fe-myd-mono/packages"
PATH=~/Projects/rinku/bin:$PATH

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="ls -lhG"
alias at="atom"
alias att="atom ."
alias gcl="git clone"
alias gc="git add . && git commit -m"
alias gcb="git checkout -b"
alias gp="git pusheen"
# alias gp="git pull"
alias gb="git branch"
alias gcp="git-clean-pull"
alias gcam="git commit -am"
alias git="hub"
eval $(thefuck --alias)

function git-pr() {
  PR_FILE=/tmp/PULL_REQUEST_TEMPLATE-$RANDOM.md
  mv -f "./PENDING_PULL_REQUEST.md" "$PR_FILE" 2> /dev/null
  if ! [ -r "$PR_FILE" ]; then
    echo "> Enter the subject here" > $PR_FILE
    echo >> $PR_FILE
    if [ -r PULL_REQUEST_TEMPLATE.md ]; then
      cat PULL_REQUEST_TEMPLATE.md >> $PR_FILE
    elif [ -r .github/PULL_REQUEST_TEMPLATE.md ]; then
      cat .github/PULL_REQUEST_TEMPLATE.md >> $PR_FILE
    fi
  fi
  vi $PR_FILE
  if [[ `grep -v "#" $PR_FILE | wc -l` -eq 0 ]]; then
    echo "Aborting due to empty PR message"
    return
  fi
  URL=`git pull-request -F $PR_FILE`
  if ! [ $? -eq 0 ]; then
    echo "Pull request failed, copied message to local directory as PENDING_PULL_REQUEST.md"
    cp $PR_FILE ./PENDING_PULL_REQUEST.md
  else
    open "$URL"
  fi
  rm -f "$PR_FILE"
}

function mkcd() {
  mkdir -p $1
  cd $1
}

function fe-checkout() {
  git clone git@github.com:domain-group/$1.git ~/Projects/$1 || return 1
  cd ~/Projects/$1
  yarn install
}

function fe-boilerplate() {
  mkdir ~/Projects/$1
  yo @domain-group/fe-boilerplate
  git add .
  git commit -m "Boilerplate"
}
