for file in ~/.{path,exports,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

source $DOTFILES_HOME/zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $DOTFILES_HOME/zshuery/completion
load_correction

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

if is_mac; then
    export EDITOR='mvim'
else
    export EDITOR='vim'
fi

chpwd() {
    update_terminal_cwd
}

# virtualenvwrapper
VIRTUALENVWRAPPER=`which virtualenvwrapper.sh`
[ -s $VIRTUALENVWRAPPER ] && source $VIRTUALENVWRAPPER