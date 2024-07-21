$env.config = {
  show_banner: false,
}

cat ~/.cache/wallust/sequences

alias fetch = fastfetch
alias launch = ~/.config/nushell/launch

alias useless = do { pacman -Qqd | pacman -Rsu --print - }

alias clr = clear

alias hx = helix
alias vi = hx
alias vim = hx
alias nano = hx

#alias icat = kitty +kitten icat
# alias icat = img2sixel -I
alias icat = meh

alias music = ncspot

alias pvpnc = do {launch nm-applet; protonvpn-cli c}
alias pvpnd = do {protonvpn-cli d;pkill nm-applet}

source ~/.zoxide.nu # zoxide init nushell | save -f ~/.zoxide.nu
# use ~/.cache/starship/init.nu
# $env.STARSHIP_CONFIG = '~/.config/Arch/Shell/Nu/starship.toml'
