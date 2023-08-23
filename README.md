# confndot

Configuration and dotfiles

![Image](https://raw.githubusercontent.com/tricantivu/confndot/master/img/desktop.png)

# Software

- **Libraries**
    - [GNU readline](https://tiswww.case.edu/php/chet/readline/rltop.html)

- **Init systems**
    - [systemd](https://systemd.io)

- **Display servers**
    - [Xorg](https://www.x.org)

- **Notifications**
    - [dunst](https://dunst-project.org)

- **Terminals**
    - [Kitty](https://sw.kovidgoyal.net/kitty)
    - [Terminator](https://gnome-terminator.org)

- **Window managers**
    - [i3](https://i3wm.org)
    - [KWin](https://userbase.kde.org/KWin)

- **Shells**
    - [ZSH](https://www.zsh.org)
    - [Bash](https://www.gnu.org/software/bash)

- **Shell prompts**
    - [Starship](https://starship.rs)

- **Editors**
    - [Vim](https://www.vim.org)
    - [Neovim](https://neovim.io)

- **File managers**
    - [ranger](https://ranger.github.io)

- **Administration**
    - [ncdu](https://dev.yorhel.nl/ncdu)
    - [logrotate](https://github.com/logrotate/logrotate)

    - **Package managers**
    - [dnf-automatic](https://dnf.readthedocs.io/en/latest/automatic.html)

    - **Resource monitors**
    - [btop](https://github.com/aristocratos/btop)
    - [htop](https://github.com/htop-dev/htop)

    - **Command scheduling**
    - [cronie](https://github.com/cronie-crond/cronie)
    - [anacron](https://sourceforge.net/projects/anacron)

- **Application launchers**
    - [rofi]()

- **Status bars**
    - [polybar](https://github.com/polybar/polybar)

- **Documentation**
    - [tealdeer](https://github.com/dbrgn/tealdeer)

- **Time keeping**
    - [calcurse](https://www.calcurse.org)

- **Feed readers**
    - [newsboat](https://newsboat.org)

- **Browsers**
    - [qutebrowser](https://qutebrowser.org)

# Usage

To get a copy of all configuration files, run:

`git clone https://github.com/tricantivu/confndot.git`

If you only want to get a specific file, do as follows:

1. Click on the file
2. Press this button:

![Button](https://docs.github.com/assets/cb-3714/images/help/repository/raw-file-button.png)

*Credits:* GitHub Documentation

3. Save the file (*e.g* `Ctrl + S`, `wget` or `curl`)

# Layout

Files and directories are copies of the ones in my home directory, except for
`etc`, `img`, `misc`. The former stores system wide configuration files, while
the latter has files with the names of all the installed packages in the
distributions I have used. This is mostly for personal use, in case I am setting
up a new system.
