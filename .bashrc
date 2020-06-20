alias push="git push origin"
alias pull="git pull origin"
alias merge="git merge origin"
alias branch="git branch"
alias log="git log"
alias reset="git reset --h"
alias add="git add"
alias com="git commit -m"
alias co="git checkout"
alias status="git status"
alias vrc="vim ~/.vimrc"
alias src="source ~/.vimrc"

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}
# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo ""`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo ""`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo ""`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo ""`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo ""`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo ""`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="
\e[33;1m\u@\e[31m\w\e[097m \d\[\e[m\]\[\e[32;40m\] \A\[\e[m\]\[\e[35;1m\] \`parse_git_branch\`\[\e[m\]
"

set -o vi

# disable the Software Flow Control (XON/XOFF flow control) (C-s / C-q)
stty -ixon

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
