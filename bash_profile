export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

TZ='Australia/Melbourne'; export TZ

source ~/.git-completion.bash
