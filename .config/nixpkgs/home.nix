{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    profileExtra = ''
      export PATH="''$HOME/.nix-profile/bin:''$PATH"
      export NIX_PATH=''$HOME/.nix-defexpr/channels''${NIX_PATH:+:}''$NIX_PATH
      export PS1="\[\033[36m\]\D{%Y-%m-%d-%I:%M%p}\[\033[00m\] \e[96m\u@''$WSL_DISTRO_NAME\e[0m:\[\033[93m\]\w\[\033[00m\]''$ "
    '';
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableNixDirenvIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "aveltras";
    userEmail = "romain.viallard@outlook.fr";
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "romain";
  home.homeDirectory = "/home/romain";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    bash
    yadm
  ];
}
