.PHONY: install
install:
	command -v brew >/dev/null 2>&1 || { /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }
	command -v ansible >/dev/null 2>&1 || { brew install ansible; }
	ansible-playbook workstation.yml -i hosts
