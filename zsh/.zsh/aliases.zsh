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
alias py="~/bin/python2.7"
alias websoc="ssh chenc3@10.255.4.111"
alias self="ssh nataila@10.8.8.88"
alias websoctest="ssh root@10.0.8.22"
alias dev-master="ssh root@10.0.8.173"
alias natailavps="ssh root@104.156.238.56"
