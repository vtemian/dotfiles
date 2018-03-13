source $HOME/.keychain/(hostname)-fish

set -g -x fish_greeting ''

set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

fish_vi_key_bindings

alias g "git"
alias ll "ls -lah"
alias p "python"
alias p3 "python3"
alias workon "vf activate"
alias sai "sudo apt-get install"
alias sau "sudo apt-get update"
alias k8stage "gcloud container clusters get-credentials --zone=us-east1-b --project=staging-reactor core"
alias k8prod "gcloud container clusters get-credentials --zone=us-east1-b --project=production-reactor core"

alias work "sudo cp /etc/hosts-block /etc/hosts"
alias fun "sudo cp /etc/hosts-orig /etc/hosts"

set -xg PATH $PATH /opt/telegram

set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8

set -xg GOPATH $HOME/.go
set -xg PATH $PATH $GOPATH/bin

set -xg PATH $PATH $HOME/bin

set -xg EDITOR vim

set -xg DRONE_SERVER https://drone.presslabs.net/

set -xg JAVA_HOME /usr/lib/jvm/java-9-openjdk-amd64/
set -xg PATH $PATH $JAVA_HOME/bin
set -xg PATH $PATH $HOME/.composer/vendor/bin

set -xg GPGKEY DE50E78A

set -gx HOSTNAME (hostname)
if status --is-interactive
  keychain --dir ~/.ssh/.keychain --eval --agents ssh,gpg id_rsa presslabs.key
  eval (keychain --eval --quiet -Q id_rsa presslabs.key)
end

eval (python -m virtualfish)
if set -q VIRTUAL_ENV
    echo -n -s  (basename "$VIRTUAL_ENV") " "
end

set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

