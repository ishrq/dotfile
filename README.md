# Dotfiles for PC

Managed using [GNU Stow](https://www.gnu.org/software/stow/).


## Instructions

1. Clone repository
```
git clone git@github.com:ishrq/dotfile.git ~/.dotfiles/
```

2. Change directory
```
cd ~/.dotfiles/
```

3. Create symlink with Stow
```
stow -S aerc bat espanso fish git gnome gopass interception librewolf mpv newsboat nvim scripts starship vale wezterm zathura
```

Remove symlink: `stow -D packages`
Re-add symlink: `stow -R packages`
