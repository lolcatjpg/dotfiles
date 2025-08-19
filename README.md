# lolcat.jpg's dotfiles

idea: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

to link a config
```bash
cd ~/dotfiles
stow NAME
```
e.g.
```
cd ~/dotfiles
stow niri.com
```

to link all for specific target:
```bash
stow *.com
stow *.laptop
# etc
```

to link systemd services:
```bash
systemctl --user link systemd/*.service
```



