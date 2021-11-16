# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/trananhkma/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(
    git
    fzf
    docker
    docker-compose
    zsh-syntax-highlighting
    zsh-autosuggestions
)

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


# system
alias hgr='history | grep '
alias psx='ps -ax | grep '
alias raminfo='sudo lshw -C memory'
alias update='sudo apt-get update'
alias cdh='cd ~/Hacking'
alias cdm='cd ~/Hacking/me'
alias cdd='cd ~/Downloads'
alias ddate="date +%Y-%m-%dT%H:%M:%S"
alias portlisten="sudo lsof -i -P -n | grep LISTEN"

# python
alias ipython='conda activate base && ipython'

# git
alias gcf='git config '
alias gcl='git clone '
alias gst='git status'
alias gcm='git commit '
alias gdf='git diff '
alias gbr='git branch '
alias gck='git checkout '
alias gch='git cherry-pick '

# docker
alias dps="docker ps"
alias dimg="docker images"
alias drun="docker run"
alias drm="docker rm"
alias dstart="docker start"
alias dstop="docker stop"
alias dcreate="docker create"
alias dexec="docker exec"

# vagrant
alias cdv="cd ~/Hacking/Vagrant"
alias vblist="vagrant box list"
alias vbadd="vagrant box add"
alias vbremove="vagrant box remove"
alias vst="vagrant status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vreload="vagrant reload"
alias vssh="vagrant ssh"
alias vdestroy="vagrant destroy"
alias vsnapc="vagrant snapshot save"
alias vsnapl="vagrant snapshot list"
alias vsnapd="vagrant snapshot delete"
alias vrestore="vagrant snapshot restore"

# salt
alias sping="salt '*' test.ping"
alias sapply="salt '*' state.apply"

# k8s
alias kpod="kubectl get pod"
alias kdeploy="kubectl get deployment"
alias kservice="kubectl get service"
alias knode="kubectl get node"
alias kingress="kubectl get ingress"
alias kapply="kubectl apply -f "

alias kdespod="kubectl describe pod"
alias kdesdeploy="kubectl describe deployment"
alias kdesservice="kubectl describe service"
alias kdesnode="kubectl describe node"
alias kdesingress="kubectl describe ingress"

alias kdelpod="kubectl delete pod"
alias kdeldeploy="kubectl delete deployment"
alias kdelservice="kubectl delete service"
alias kdelingress="kubectl delete ingress"
alias kdelname="kubectl delete namespace"

alias sav="sudo /opt/Symantec/symantec_antivirus/sav"
alias report="sudo /etc/init.d/symcfgd report && sudo cat /var/log/symantec/symcfgd_report.log && sav log -e /home/trananhkma/Documents/scanlog.csv"
alias zap="bash /home/trananhkma/Tools/ZAP_2.9.0/zap.sh -cmd"

alias pip='noglob pip'
alias pipenv='noglob pipenv'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
