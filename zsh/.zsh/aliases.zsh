alias tmux="tmux -2"

if [[ "$(uname)" == "Darwin" ]]; then
	# For Mac OS
	alias ls='ls -hG'
elif [[ "$(uname)" == "Linux" ]];then
	# For Linux
	alias ls='ls --color=auto'
else
	:
fi
alias ll='ls -al'
alias lls='ls -alSh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'

alias treepy='tree -I "*.pyc"'

alias vix='vi --cmd "set expandtab"'

# Command-Line Tools `t`
# https://github.com/tankywoo/t
alias t='python ~/.t/t.py --task-dir ~/.tasks --list tasks'
alias tpush='cd ~/.tasks/; git add tasks .tasks.done; git commit -m "add tasks"; git push; cd -'
alias tpull='cd ~/.tasks/; git pull; cd -'
alias tst='cd ~/.tasks/; git status; cd -'

alias json="python -mjson.tool"

alias tmuxo="tmux attach -t"
alias tmuxn="tmux new -s"
alias getenv="source ~/opt/radar/bin/activate"
alias pyserver="python -m SimpleHTTPServer"
alias tmuxo="tmux attach -d -t"
alias tmuxn="tmux new -s"
alias p="proxychains4 -f /Users/nataila/.proxychains/proxychains.conf"
alias subl=\''/Applications/Sublime Text.app/Contents/SharedSupport/bin'\'
alias curltime="curl -o /dev/null -s -w connect:%{time_connect},starttransfer:%{time_starttransfer},timetotal:%{time_total}:%{time_namelookup}:%{speed_download}"

# alias brclean = "git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d"
