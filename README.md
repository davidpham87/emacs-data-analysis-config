# Emacs config for data analysis

This is a fork of emacs-live for data analysis and probably Swiss
keyboard. Taking the excellente emacs-live base, I set my own preferences to the
emacs editor and here are the configuration files.

The modularity of emacs-live should be appreciated here.

## Why this repository?

R, Python and LaTeX are not in the emacs-live packages and I used my own
*.emacs* configuration to enhance it. This mainly serves as a way to make a
quick and dirty installation of my emacs editors as I have to work on several
*linux*-computers (and Windows 7). Feel free to fork and use as you want!

It also includes some facilities to write markdown document (livedown).

## Configuration

You need to set the *.emacs-live.el* file in your root folder and overwrite your
*.emacs.d* folder with this repository.

## French Swiss keyboard

I strongly advise to rebind the keys to your convenience. Most keybindings are
standard, however, some are specific to french swiss keyboards. You can find
them in the `packs/swiss-keyboard/` subfolder. I remapped the the `AltGr + key`
to `M-key` and also use `C-é` and `M-é` for characater and word
backward-deleting.

## Some Emacs hints

+ Use your two hands for doing the keys using the `Alt` and `Ctrl` keys.
+ For comfort and avoid *emacs pinky* disease: use your palm for hitting the
  `Ctrl` key on a flat keyboard. I use a Logitech K750 solar keyboard which is
  pretty flat and allows effortlessly this technique. I admit I have no
  experience with the mechanical keyboard, so you might want to dig into this
  direction maybe.
+ Try to avoid using the `backspace` and `RET` keys (and use your key for the
  backward deleting functions and `C-j` instead). You'll avoid to move your hand
  uselessly.
+ `C-s` and `C-r` are your best friend to jump and look for code. `C-o` from
  emacs-live package is also worth mentioning.

## Font Source Code Pro

[Source code pro](https://github.com/adobe-fonts/source-code-pro) is an open-source font from adobe. To install it, download the (source)[https://github.com/adobe-fonts/source-code-pro/releases] and install them. Instruction on (this page)[https://github.com/adobe-fonts/source-code-pro].

## Mirroring update from emacs live

Taking information from
[github help](https://help.github.com/articles/syncing-a-fork/), you can fire up
your shell and copy-paste.

```bash 
git fetch upstream
git checkout master
git merge upstream/master
```
