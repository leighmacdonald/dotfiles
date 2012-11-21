# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias music='mplayer http://cudd.li:8000/stream.ogg'

PATH=/usr/local/bin:$PATH
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

#git config user.name = 'Leigh MacDonald'
#git config user.email = 'leigh.macdonald@gmail.com'
#export GIT_AUTHOR_NAME='Leigh MacDonald'
#export GIT_AUTHOR_EMAIL='leigh.macdonald@gmail.com'
export PATH="/usr/sbin:/usr/perl5/5.12/bin:/opt/solarisstudio12.3/bin:$PATH"
export MANPATH="/opt/solarisstudio12.3/man:$MANPATH"
