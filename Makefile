CWD=$(shell pwd)

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
		; do ln -fs ${CWD}/$$f ${HOME}/.$$f; done

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

zsh: zsh/zsh/bin/zsh

zsh/source/configure:
	zsh/source/Util/preconfig

zsh/source/Makefile: zsh/source/configure
	cd zsh/source && ./configure --prefix="$(shell pwd)/zsh/zsh"

zsh/zsh/bin/zsh: zsh/source/Makefile
	cd zsh/source && make && make install
