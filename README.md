# Dotfiles

These are my personal dotfiles, actually I'm using a mix of macOS, Windows WSL and Manjaro, so I'll try to keep this compatible as much as I can with the three.

I'm just starting with my day to day Manjaro configuration, then I will try this on other system when I need it.

## Structure

I will try to organize the dotfiles using the [Stow method](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).
I think this approach will help managing differences between systems (ie. AwesomeWM config is needed only in Manjaro + AwesomeWM).

## Roadmap

- [ ] Add the default system dotfiles to the repo
- [ ] Refactor the default configs - ie. split Zsh config in base, functions, aliases, ...
- [ ] Import and refactor the old configurations (Zsh, Neovim) keeping what I like about the default
- [ ] Proceed with Manjaro configuration
- [ ] Eventually fix for macOS and Windows WSL

## Notes

Here are some articles I will use as a reference and tools I want to try:

- [Using GNU Stow to manage your dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- [How to secure your dotfiles](https://abdullah.today/blog/how-to-manage-dotfiles.html) - Maybe store on Keybase only files that need encryption
- [Git subtree and submodels - Stow powered dotfiles](https://github.com/andschwa/dotfiles)
- [Antigen - The plugin manager for zsh](https://github.com/zsh-users/antigen)
- [Liquid Prompt - a useful adaptive prompt for Bash & zsh](https://github.com/nojhan/liquidprompt)
- [GitHub ❤ ~/](https://dotfiles.github.io/)

## Software

This is the software needed to make the config usable.

### OS agnostic

- [GNU Stow](https://www.gnu.org/software/stow/) - [Manjaro package](https://www.archlinux.org/packages/community/any/stow/)
- [fzf](https://github.com/junegunn/fzf) - [Manjaro package](https://www.archlinux.org/packages/community/x86_64/fzf/)
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) - [Manjaro package](https://www.archlinux.org/packages/community/x86_64/the_silver_searcher/)
- [zplug](https://github.com/zplug/zplug)
- [Patched Input Font](http://input.fontbureau.com/) - [Manjaro package](https://aur.archlinux.org/packages/ttf-nerd-fonts-input/)
- pyenv

### Manjaro

- [playerctl](https://github.com/acrisci/playerctl) - [Manjaro package](https://www.archlinux.org/packages/community/x86_64/playerctl/)
- [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) - [Manjaro package](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/)

### Neovim


### Tmux

```
# For Mac
brew install automake autoconf ncurses libevent pkg-config utf8proc

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure --enable-utf8proc # Flag required only on Mac
make && sudo make install

# Fow Windows WSL
apt install libevent-dev ncurses-dev build-essential bison pkg-config autotools-dev automake

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && make install

# Then install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf # Reload the config
# Then `prefix I` to install the plugins followed by a restart.
```

Source: https://github.com/tmux/tmux/wiki/Installing#from-version-control

### Font

JetBrains Mono from https://www.nerdfonts.com/font-downloads

### SSH

On Windows WSL, the [`keychain` utility](https://www.funtoo.org/Funtoo:Keychain) takes care of starting the correct SSH agent at startup, asking for the SSH key passphrase only at boot:
```
sudo apt install keychain
```
