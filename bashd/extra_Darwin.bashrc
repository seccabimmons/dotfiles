#!/bin/bash

##
# Mac-specific Settings
##

# use GNU programs instead of pre-installed Apple versions
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
export PATH

# colored terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# define aliases
alias vi="mvim"
alias finder="open ."
alias f='open -a Finder ./'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# For MacOS Catalina and above, do not show the warning that zsh is the new default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# taken from http://brettterpstra.com/2013/02/09/quick-tip-jumping-to-the-finder-location-in-terminal/
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}

# taken from https://natelandau.com/my-mac-osx-bash_profile/
trash() {
	command mv "$@" ~/.Trash
}

showHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles -boolean true
	killall Finder
}

hideHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles -boolean false
	killall Finder
}

