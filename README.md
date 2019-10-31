# Dotfiles for Mac

There's some prep-work that needs to be done before these will all work, and
I'm not so confident I remember all the steps. It is assumed that someone using
these config files will have the following things installed

* neovim (text editor)
* yabai (mac window manager)
* skhd (mac keyboard shortcut manager)
* bat (cat, but with syntax highlighting)
* ripgrep (grep, but it's a ripper)
* fzf (probably not even necessary)
* vim-plug (you want them sick plugins bro)
* all the python junk that neovim needs to be happy

Also, there are some required coc-vim plugins.
* coc-ultisnips
* coc-yank
* coc-git
* coc-highlight
* coc-eslint
* coc-prettier
* coc-tabnine
* coc-css
* coc-python
* coc-json 

Not so sure these will get installed automatically, so you might need to install them using

```
:CocInstall coc-ultisnips coc-yank coc-git coc-highlight coc-eslint coc-prettier coc-tabnine coc-css coc-python coc-json
```

Hopefully everything works, if it doesn't it's probably you're fault because I'm without flaws.
