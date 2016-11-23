#!/bin/sh

## X window
mv ~/.Xresources ~/.Xresources.orig
ln -s ~/src/DotFiles-Linux/.Xresources ~/.Xresources
# mv ~/.xsession ~/.xsession.orig
# ln -s ~/src/DotFiles-Linux/.xsession ~/.xsession

## LXDE desktop (openbox WM)
# mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.orig
# ln -s ~/src/DotFiles-Linux/.config/openbox/debian-testing-jessie-lxde-rc.xml ~/.config/openbox/lxde-rc.xml

## Bash
mv ~/.bashrc ~/.bashrc.orig
ln -s ~/src/DotFiles-Linux/.bashrc ~/.bashrc
mv ~/.bash_logout ~/.bash_logout.orig
ln -s ~/src/DotFiles-Linux/.bash_logout ~/.bash_logout
mv ~/.profile ~/.profile.orig
ln -s ~/src/DotFiles-Linux/.profile ~/.profile

## fbterm
mv ~/.fbtermrc ~/.fbtermrc.orig
ln -s ~/src/DotFiles-Linux/.fbtermrc ~/.fbtermrc

## urxvt
mv ~/.urxvt ~/.urxvt.orig
ln -s ~/src/DotFiles-Linux/.urxvt ~/.urxvt

## tmux
ln -s ~/src/DotFiles-Linux/.tmux.conf ~/.tmux.conf

## tmuxinator
rm -rf ~/.tmuxnator
ln -s ~/src/DotFiles-Linux/.tmuxinator ~/.tmuxinator

## latexmk
mv ~/.latexmkrc ~/.latexmkrc.orig
ln -s ~/src/DotFiles-Linux/.latexmkrc ~/.latexmkrc

## Emacs
ln -s ~/src/DotEmacs ~/.emacs.d
if [ ! -d "~/.local/share/applications/" ]; then
  mkdir -p ~/.local/share/applications/
fi
ln -s ~/src/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s ~/src/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop

## MATLAB
# ln -s ~/src/DotFiles-Linux/.local/share/applications/MATLAB.desktop ~/.local/share/applications/MATLAB.desktop

## JabRef
ln -s ~/src/DotFiles-Linux/.local/share/applications/JabRef.desktop ~/.local/share/applications/JabRef.desktop

## Git
mv ~/.gitconfig ~/.gitconfig.orig
ln -s ~/src/DotFiles-Linux/.gitconfig ~/.gitconfig

## fish and fishman
# if [ ! -d "~/.config/fish/" ]; then
#   mkdir -p ~/.config/fish
# fi
# mv ~/.config/fish/config.fish ~/.config/fish/config.fish.orig
# ln -s ~/src/DotFiles-Linux/.config/fish/config.fish ~/.config/fish/config.fish
# mv ~/.config/fish/completions ~/.config/fish/completions.orig
# mkdir ~/.config/fish/completions
# ln -s ~/src/DotFiles-Linux/.config/fish/completions/fisher.fish ~/.config/fish/completions/fisher.fish
# ln -s ~/src/DotFiles-Linux/.config/fish/completions/tmuxinator.fish ~/.config/fish/completions/tmuxinator.fish
# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
# fisher z fzf fin fnm git_util gitignore nitro

update-desktop-database ~/.local/share/applications/
