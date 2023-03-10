# Author: IA
# ---


function sync -d "Sync files between devices"

    if test $USER = "u0_a1692" #S8
        set dest "laptop"

        rsync -auzP ~/storage/shared/Documents/COMPUTER/ laptop:~/
        rsync -auzP ~/storage/dcim/Screenshots/ laptop:~/ARCHIVE/Screenshots/
        rsync -auzP ~/storage/shared/backups/ laptop:~/ARCHIVE/Backup_S8/

    else
        set dest "s8"

        rsync -auzP ~/RESOURCES/ s8:~/storage/shared/Documents/COMPUTER/RESOURCES/
        rsync -auzP ~/ARCHIVE/{Workouts,Daybook,Weight-Log,Logs,Journal} s8:~/storage/shared/Documents/COMPUTER/ARCHIVE/

    end

    rsync -auzP ~/.config/newsboat/ $dest:~/.config/newsboat/
    rsync -auzP ~/.local/share/newsboat/ $dest:~/.local/share/newsboat/
    rsync -auzP ~/.config/fish/config.fish $dest:~/.config/fish/
    rsync -auzP --exclude={autopair,fzf,sponge}.fish ~/.config/fish/conf.d/ $dest:~/.config/fish/conf.d/
    rsync -auzP ~/.config/nvim/snippets/ $dest:~/.config/nvim/snippets/
    rsync -auzP ~/.config/nvim/skeletons/ $dest:~/.config/nvim/skeletons/
    rsync -auzP ~/.config/git/config $dest:~/.config/git/

end
