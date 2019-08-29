cp ~/.bash_aliases ./bash_aliases
cp ~/.bashrc ./bashrc

# git
cp ~/.gitconfig ./gitconfig

# Tmux
cp ~/.tmux.conf ./tmux.conf
cp ~/.tmux/session1 ./tmux/


# Vim
cp ~/.viminfo ./viminfo
if [ -d "~/.vim/" ]; then
	if [ ! -d "./vim/" ]; then
		mkdir ./vim	
	fi
	cp ~/.vim/vimrc ./vim/vimrc
fi

