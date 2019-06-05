# export RUBYOPT=-rubygems
export RUBYLIB=/var/lib/gems/1.8
export EDITOR=vim
export LSCOLORS="dxfxcxdxbxegedabagacad"
export M2_HOME=/opt/carpass/apache-maven
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export JAVA_HOME=/opt/carpass/java
export NODE_HOME=/opt/nodejs
export KARAF_DEBUG=

export PGHOST=postgres.gcloud.roots.be
export PGUSER=postgres
export PGDATABASE=postgres

export PATH=/opt/scripts:$PATH
export PATH=/opt/carpass/scripts/jboss:$PATH
export PATH=/opt/carpass/scripts/fuse:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/Cellar/gnu-sed/4.2.2:$PATH
export PATH=~/Library/Python/2.7/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=~/.sencha/Cmd:$PATH
export PATH=~/.bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$NODE_HOME/bin:$PATH
export PATH=$M2_HOME/bin:$PATH
export PATH=$PATH:.

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.google-cloud-sdk/path.zsh.inc' ]; then . '~/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/.google-cloud-sdk/completion.zsh.inc' ]; then . '~/.google-cloud-sdk/completion.zsh.inc'; fi
