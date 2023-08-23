if pgrep -i 'xorg' 1> /dev/null; then
    return

else
    startx

fi
