# Alpine WSL dotfiles  <!-- omit in toc -->

Windows WSL2 dotfiles managed with [Nix](https://nixos.org/download.html), [Home Manager](https://github.com/nix-community/home-manager) and [yadm](https://yadm.io/)

- [Setup instructions](#setup-instructions)
  - [Enabling WSL 2 under Windows](#enabling-wsl-2-under-windows)
  - [Installing Alpine from the Microsoft Store](#installing-alpine-from-the-microsoft-store)
  - [Setting up sudo](#setting-up-sudo)
  - [Preparing Alpine for Docker and VSCode](#preparing-alpine-for-docker-and-vscode)
  - [Installing Docker for Windows](#installing-docker-for-windows)
  - [Optional: Managing your packages with Nix and Home Manager](#optional-managing-your-packages-with-nix-and-home-manager)

## Setup instructions

### Enabling WSL 2 under Windows

Follow instructions available [here](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10)

### Installing Alpine from the Microsoft Store

https://www.microsoft.com/fr-fr/p/alpine-wsl/9p804crf0395

### Setting up sudo

From Windows cmd.exe, run the following to enter an Alpine shell as root user:

```bash
wsl --distribution Alpine --user root
```
Install the sudo package
```bash
apk add sudo
```

Edit the sudoers file with:
```bash
visudo /etc/sudoers
```

Uncomment and edit the line which starts with ***%sudo*** so that it looks like the following:
```bash
%sudo ALL=(ALL) NOPASSWD: ALL
```

You can then create the sudo group and add your user to it:
```bash
addgroup sudo
usermod -aG sudo <your_username>
```
You can now quit the root session as we'll proceed with our default user now on.

### Preparing Alpine for Docker and VSCode

For Docker Desktop for Windows to work with Alpine WSL. We need to install glibc which is available [here](https://github.com/sgerrand/alpine-pkg-glibc). We can run the following commands:

```bash
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk

sudo apk add glibc-2.32-r0.apk
sudo apk add docker-cli
```

We'll also need the following to get VSCode remote server to work under Alpine:
```bash
sudo apk add libstdc++
```

### Installing Docker for Windows

Installer is available [here](https://hub.docker.com/editions/community/docker-ce-desktop-windows).
Once installed, we must enable the the WSL integration for Alpine in the settings under ***Resources > WSL Integration***.

### Optional: Managing your packages with Nix and Home Manager

We'll first install curl to run the Nix installer.

```bash
sudo apk add curl
```

We can then install Nix using the script available from the website:

```bash
curl -L https://nixos.org/nix/install | sh
```

Further instructions related to installing Home Manager can be followed on the project's [readme](https://github.com/nix-community/home-manager#installation).