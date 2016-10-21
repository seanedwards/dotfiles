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

