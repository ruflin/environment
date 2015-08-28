#/bin/bash

setup:
	# install brew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
	# Install base packages
	cat brew.txt | xargs brew install

	# install cask packages
	cat brew-cask.txt | xargs brew cask install --appdir=/Applications
		
# Updates the list of installed packages
update-lists:
	brew leaves > brew.txt
	brew cask list > brew-cask.txt
	
	
update-all:
	brew update
	brew cask update
	brew upgrade
	
cleanup:
	brew cleanup
	brew cask cleanup