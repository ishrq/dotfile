# DOT-FILES

Dot-files are managed using [GNU Stow](https://www.gnu.org/software/stow/).


## INSTRUCTIONS

1. Create .dotfile/ directory in $HOME
2. Copy files in a way that it replicates the actual folder hierarchy
    ```
    # e.g. for fish configs
    cd .dotfile/
    mkdir fish/.config/
    cd ~/.config
    cp fish/ ~/.dotfile/fish/.config/
    ```
3. To create symlink: `stow fish`
4. To remove symlink: `stow -D fish`
