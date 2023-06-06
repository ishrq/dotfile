# Dot-files for PC

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


### Fish Plugins

Fish plugins managed with [Fisher](https://github.com/jorgebucaran/fisher)

Install Fisher:

```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

Install plugins:

[Patrickf1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
```
fisher install Patrickf1/fzf.fish
```

[meaningful-ooo/sponge](https://github.com/meaningful-ooo/sponge)
```
fisher install meaningful-ooo/sponge
```

[jorgebucaran/autopair.fish](https://github.com/jorgebucaran/autopair.fish)
```
fisher install jorgebucaran/autopair.fish
```

Update plugin: `fisher update <plugin`

Update all: `fisher update`

Remove plugin: `fisher remove <plugin>`

Remove all: `fisher list | fisher remove`


### Interception Tools

Detailed instructions in [Interception Tools](https://gitlab.com/interception/linux/tools).

Plugins:
[dual-function-keys](https://gitlab.com/interception/linux/plugins/dual-function-keys)

My mappings:
1. `CAPSLOCK` - `ESC` on tap, `CTRL` on hold
2. `LEFT SHIFT` - `$` on tap
3. `RIGHT ALT` - `BACKSPACE` on tap
