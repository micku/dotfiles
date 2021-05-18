Disclaimer, this is a copy of the [article from Jake Barnes](https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be).

# How to actually get italics and true colour to work in iTerm + tmux + vim

There's lots of partial/out-of-date info on this so I thought I'd post what actually worked for me.

## Configure `terminfo`

Create `xterm-256color-italic.terminfo`:

```
xterm-256color-italic|xterm with 256 colors and italic,  
  sitm=\\E\[3m, ritm=\\E\[23m,  
  use=xterm-256color,
```

And `tmux-256color.terminfo`:

```
tmux-256color|tmux with 256 colors,  
  ritm=\\E\[23m, rmso=\\E\[27m, sitm=\\E\[3m, smso=\\E\[7m, Ms@,  
  khome=\\E\[1~, kend=\\E\[4~,  
  use=xterm-256color, use=screen-256color,
```

That third line is necessary to make home and end keys work inside tmux.

Then to install them, run:

```
$ tic -x xterm-256color-italic.terminfo  
$ tic -x tmux-256color.terminfo
```

## Configure iTerm

Go to Preferences > Profiles > Default.

Make sure Text > Italic text allowed is checked.

Set Terminal > Report Terminal Type to `xterm-256color-italic`.

This essentially sets the value of the environment variable `TERM`, which you could also set in your `~/.bashrc` etc, depending on how you want to store your settings.

## Configure tmux

You need at least about version 2.5 (2.3 at least prevents backgrounds from working).

Add this to your `~/.tmux.conf`:

```
set -g default-terminal 'tmux-256color'  
set -as terminal-overrides ',xterm\*:Tc:sitm=\\E\[3m'
```

This again sets `TERM` inside tmux. The second line is even more important though: `Tc` allows vim to enable true colours, and and `sitm` allows the same with italics.

As far as I can tell, aliasing `tmux -2` isn't necessary.

## Configure vim

You need a relatively recent version, but 8.0 should be fine.

Add the following to your `~/.vimrc`:

```
let &t\_8f="\\<Esc>\[38;2;%lu;%lu;%lum"  
let &t\_8b="\\<Esc>\[48;2;%lu;%lu;%lum"  
set termguicolors
```

The first two lines forces true colour on, since vim can't detect it within tmux. The last line on its own will work outside tmux, but result in no colours inside tmux.

Again, as far as I can tell, stuff like setting `t_Co` isn't necessary.

Of course you need a theme which supports true colour and italics to really test this. I'd recommend [gruvbox](https://github.com/morhetz/gruvbox), and setting `let g:gruvbox_italic=1`.

## SSH

Hacking all this stuff in may break some things. One that will definitely break is that `ssh` forwards your `TERM` (which can't be disabled), and since we're using custom ones they won't exist on the remote server. I'd recommend adding the following alias to your `~/.bashrc` etc:

alias ssh='TERM=xterm-256color ssh'

This terminal should exist on most servers. If you still have issues, try just `xterm`.

However, if you have a server you use regularly, you can get this working on there as well. Basically follow the same steps as above on the server and it should work. Again the custom `TERM` may break other things, like `ls` colours, which I fix with:

```
eval $(TERM=xterm dircolors)  
alias ls='ls --color=auto'
```
