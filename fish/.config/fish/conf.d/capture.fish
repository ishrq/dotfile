# Author: IA
# ---


function capture
  if test -d "$HOME/ARCHIVE"
    set file ~/ARCHIVE/Journals/Backlog/capture.txt
  else
    set file ~/storage/shared/Documents/COMPUTER/ARCHIVE/Journals/Backlog/capture.txt
  end

  switch $argv
    case $argv
      echo $argv >> $file && echo "[Entry captured]"
    case ''
      $EDITOR $file
  end
end

abbr -a c ' capture'
