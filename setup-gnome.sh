#!/bin/sh

# Start pinned apps with Super + F1-F9
gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Super>F1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Super>F2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Super>F3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Super>F4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Super>F5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Super>F6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Super>F7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Super>F8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Super>F9']"

# Switch workspaces with Super + 1-9
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"

# Move windows to workspaces with Shift + Super + 1-9
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Shift><Super>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Shift><Super>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Shift><Super>9']"

gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "['<Alt>F9']"

org.gnome.settings-daemon.plugins.media-keys calculator ['<Shift><Super>equal']
org.gnome.settings-daemon.plugins.media-keys email ['<Shift><Super>e']
org.gnome.settings-daemon.plugins.media-keys home ['<Shift><Super>f']
org.gnome.settings-daemon.plugins.media-keys help []
org.gnome.settings-daemon.plugins.media-keys www ['<Shift><Super>b']


# Fixed workspeces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5

# Alt+Tab to swith between windows not applications
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# Keyboard layouts
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'sk+prog'), ('xkb', 'ru+yazherty')]"
