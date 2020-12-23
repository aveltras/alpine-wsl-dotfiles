# Alpine WSL dotfiles

Windows WSL2 dotfiles managed with [Nix](https://nixos.org/download.html), [Home Manager](https://github.com/nix-community/home-manager) and [yadm](https://yadm.io/)

## Setup

### Enabling WSL 2

Follow instructions available [here](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10)

### Install Alpine from the Microsoft Store

https://www.microsoft.com/fr-fr/p/alpine-wsl/9p804crf0395

### Preparing Alpine for Docker and VSCode

For Docker Desktop for Windows to work with Alpine WSL. We need to install glibc which is available [here](https://github.com/sgerrand/alpine-pkg-glibc). We can run the following commands as root:

```bash
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk

apk add glibc-2.32-r0.apk
apk add docker-cli
```

We'll also need the following to get VSCode remote server to work under Alpine:
```bash
apk add libstdc++
```

### Installing Docker for Windows

Installer is available [here](https://hub.docker.com/editions/community/docker-ce-desktop-windows).
Once installed, we must enable the the WSL integration for Alpine in the settings under ***Resources > WSL Integration***.