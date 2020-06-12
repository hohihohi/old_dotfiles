## vim:ft=zplug
#
#ZPLUG_SUDO_PASSWORD=
#ZPLUG_PROTOCOL=ssh
#
#zplug "zplug/zplug", hook-build:'zplug --self-manage'
#
#zplug "~/.zsh", from:local, use:"<->_*.zsh"
#
#zplug "hohihohi/enhancd", use:init.sh
#if zplug check "hohihohi/enhancd"; then
#    #export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
#    export ENHANCD_FILTER="fzf --height 25% --reverse --ansi"
#    export ENHANCD_DOT_SHOW_FULLPATH=1
#fi
#zplug "hohihohi/zsh-vimode-visual", use:"*.zsh", defer:3
#zplug "zsh-users/zsh-completions"
##zplug "zsh-users/zsh-history-substring-search", defer:3
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#
#zplug "glidenote/hub-zsh-completion"
#zplug 'Valodim/zsh-curl-completion'
#
#zplug 'hohihohi/epoch-cat', \
#    as:command, \
#    hook-build:'go get -d && go build'
#
#zplug "stedolan/jq", \
#    as:command, \
#    from:gh-r, \
#    rename-to:jq
#
#zplug "junegunn/fzf-bin", \
#    as:command, \
#    from:gh-r, \
#    rename-to:"fzf", \
#    frozen:1
#
#zplug "monochromegane/the_platinum_searcher", \
#    as:command, \
#    from:gh-r, \
#    rename-to:"pt", \
#    frozen:1
#
#zplug "peco/peco", \
#    as:command, \
#    from:gh-r, \
#    frozen:1
#
#zplug "motemen/ghq", \
#    as:command, \
#    from:gh-r, \
#    rename-to:ghq
#
#zplug "fujiwara/nssh", \
#    as:command, \
#    from:gh-r, \
#    rename-to:"nssh", \
#    frozen:1
#
#zplug 'tcnksm/ghr',   as:command, hook-build:'go get -d && go build'
#zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'
#
#zplug "philovivero/distribution", \
#    as:command, \
#    use:distribution, \
#    if:'(( $+commands[perl] ))'
#
#zplug "mitmproxy/mitmproxy", \
#    as:command, \
#    hook-build:"sudo python ./setup.py install"
#
#zplug "wg/wrk", \
#    as:command, \
#    hook-build:"make"
#
#zplug "mattn/jvgrep", as:command, from:gh-r
#
##zplug "reorx/httpstat", \
##    as:command, \
##    use:'(httpstat).py', \
##    rename-to:'$1', \
##    if:'(( $+commands[python] ))'
#
#zplug "hohihohi/httpstat", \
#    as:command, \
#    use:'(*).sh', \
#    rename-to:'$1'
#
#zplug 'kouzoh/mercari', \
#    as:command, \
#    use:'hohihohi/(*).sh', \
#    rename-to:'$1'
#
#zplug "jhawthorn/fzy", \
#    as:command, \
#    hook-build:"make && sudo make install"
#
#zplug "hohihohi/git-open", as:command, at:patch-1
#zplug "hohihohi/open-link.sh", as:command, use:'(*).bash', rename-to:'$1'
#zplug "hohihohi/zsh-gomi", as:command, use:bin/gomi
#zplug "hohihohi/ssh-keyreg", as:command, use:bin
#zplug "mrowa44/emojify", as:command
#zplug 'hohihohi/copy', as:command, use:'(*).sh', rename-to:'$1'
#
## zplug "hohihohi/ultimate", as:theme
#if zplug check "hohihohi/ultimate"; then
#    zstyle ':ultimate:prompt:path' mode 'shortpath'
#fi
#source /Users/hohihohi/src/github.com/hohihohi/ultimate/ultimate.zsh-theme
##zplug 'themes/agnoster', from:oh-my-zsh
#
## zplug mafredri/zsh-async, from:github
## zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#
#zplug 'hohihohi/zplug-doctor', lazy:yes
#zplug 'hohihohi/zplug-cd', lazy:yes
#zplug 'hohihohi/zplug-rm', lazy:yes
#
#zplug 'hohihohi/tmux-powertools', \
#    hook-load:'tmux-loader'
#
##zplug 'hohihohi/git-powertools', \
##    as:command, \
##    use:'bin/*'
#
#zplug 'hohihohi/zls', lazy:yes
#zplug 'hohihohi/fpath-editor', lazy:yes
#
#zplug 'andialbrecht/sqlparse', \
#    as:command, \
#    hook-build:'python setup.py install'
#
#zplug 'dtan4/ghrls', \
#    as:command, \
#    hook-build:'go get -d && go build'
#
#zplug 'tianon/gosleep', \
#    as:command, \
#    hook-build:'go get -d ./src/gosleep/... && go build ./src/gosleep/...'
#
#zplug 'hohihohi/fzf-powertools', \
#    as:command, \
#    use:'re'
#
##zplug 'hohihohi/git-switch', \
##    as:command, \
##    use:'(*).sh', \
##    rename-to:'$1'
#
#zplug 'mutantcornholio/prok', \
#    as:command, \
#    use:'(*).sh', \
#    rename-to:'$1'
#
#zplug 'hohihohi/ltsv.sh', \
#    as:command, \
#    use:'(ltsv).sh', \
#    rename-to:'$1'
#
##zplug 'hohihohi/zsh-history', defer:3, use:init.zsh
#zplug 'hohihohi/zsh-history', as:command, use:misc/fzf-wrapper.zsh, rename-to:ff
#if zplug check 'hohihohi/zsh-history'; then
#    export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
#    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
#    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
#    ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
#    ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
#    ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"
#fi
#
#zplug 'hohihohi/git-fzf', hook-build:'make'
#zplug 'hohihohi/git-fzf', \
#    as:command, \
#    use:'bin/(git-*).zsh', \
#    rename-to:'$1'
#
#zplug 'hohihohi/dbl', \
#    as:command, \
#    use:'(dbl).zsh', \
#    rename-to:'$1'
#
#zplug 'hohihohi/kubernetes-alias', use:zshrc
#
## zplug 'hohihohi/history', use:misc/zsh/init.zsh
## if zplug check 'hohihohi/history'; then
##     export ZSH_HISTORY_AUTO_SYNC=false
## fi
#
#
#  zplug "ogham/exa", \
#    from:gh-r, \
#    as:command, \
#    rename-to:exa, \
#    use:"*macos*"
#
#zplug "akarzim/zsh-docker-aliases"
#
#export ZSH_HISTORY_AUTO_SYNC=false
#source "/Users/hohihohi/src/github.com/hohihohi/history/misc/zsh/init.zsh"
