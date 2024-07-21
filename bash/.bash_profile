#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ ! -z "{XDG_VTNR}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi
