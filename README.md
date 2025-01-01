# Requisitos para la configuracion
---
## Homebrew
Gestor de paquetes elegido por su facilidad de uso y numero de paquetes disponibles y que usaremos para instalar casi todo lo que necesitamos.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
---
## Wezterm
Terminal que cambiaremos en lugar de alacritty, elegida por su velocidad y facilidad de configuracion.
```bash
brew install --cask wezterm
```
---
## AeroSpace
Window Manager que toma el lugar de Yabai por su facil instalacion y configuracion a diferencia de yabai.
```bash
brew install --cask nikitabobko/tap/aerospace
```
---
## FiraMono Nerd Font
Nuestra fuente por defecto.
```bash
brew install --cask font-fira-mono-nerd-font
```
---
## Herramientas CLI
### FuziFinder
Herramienta de busqueda de archivos
```bash
brew install fzf
```
### GCC
Herramientas de compilacion
```bash
brew install gcc
```
### Eza
Herramienta que mejora el comando ls
```bash
brew install eza
```
### Zoxide
Herramienta que mejora la navegacion entre archivos.
```bash
brew install zoxide
```
### Yazi
Herramienta File Manager
```bash
brew install yazi
```
#### Herramientas para Yazi
Herramientas varias necesarias para el perfecto funcionamiento de Yazi
```bash
brew install ffmpeg sevenzip jq poppler fd ripgrep imagemagick font-symbols-only-nerd-font
```
### Lua y Luarocks
Necesarios para algunos plugins de nuestro editor de codigo Neovim.
```bash
brew install lua luarocks
```
### Wget
Peticiones http y mas
```bash
brew install wget
```
### NVM
Node Version Manager nos permite tener diversas versiones de node.
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
```
---
## Neovim
Nuestro editor de codigo.
```bash
brew install neovim
```
> [!NOTE]
> Recuerda sincronizar los plugins con lazy e instalar posteriormente los lsp con Mason y TSInstall de los lenguajes necesarios.
---
## Tmux
El multiplexor para terminal que ocupara el lugar de zellij.
```bash
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
> [!NOTE]
> Recuerda instalar los plugins con Alt-a I y recargar la configuracion con Alt-a r.
