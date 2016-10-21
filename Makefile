CWD=$(shell pwd)

install: links vim rbenv
	echo ${CWD} > ${HOME}/.dotfilesdir

links:
	for f in \
		vimrc \
		vim \
		zshrc \
		zsh \
		tmux.conf \
		tmux \
		bin \
		gitconfig \
		gitignore_global \
		hgrc \
		hgignore_global \
		; do ln -sfn ${CWD}/$$f ${HOME}/.$$f; done

brew:
	for p in \
		binutils \
		coreutils \
		autogen \
		autoconf \
		automake \
		awscli \
		jq \
		rbenv \
		thefuck \
		ctags \
		htop \
		zsh \
		vim \
		; do brew ls --versions $$p && brew upgrade $$p || brew install $$p || true; done

rbenv:
	zsh -c 'rbenv install -s 2.3.0 && rbenv global 2.3.0'

vim:
	vim +VundleInstall +qall

