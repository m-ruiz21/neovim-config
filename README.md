# Installation #
First, install neovim 0.8 or higher
```
sudo apt-get install neovim
```
or for windows:
```
winget install Neovim.Neovim
```

It's set up so that everything installs automatically when you first open up vim. So after you have downloaded neovim, all you have to do is clone it.
```
git clone https://github.com/m-ruiz21/neovim-config.git ~/.config/nvim
```
for windows:
```
C:\Users\USERNAME\AppData\Local\nvim
```

# Optional Steps #
If using wsl, to give access to system clipboard:
```
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```
