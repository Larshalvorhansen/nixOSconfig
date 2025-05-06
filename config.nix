
{ config, pkgs, ... }:

{
  imports =
    [       ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";   

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "no";
    variant = "winkeys";
    options = "ctrl:nocaps";   };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  users.users.lhh = {
    isNormalUser = true;
    description = "Lars Halvor";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim      wget
      alacritty
      git
      tmux
      cmatrix
      element-desktop
      neovim
      w3m
      libreoffice
      tree
      neofetch
      zotero
      bitwarden-desktop
      tcpdump
      xclip
  ];
  system.stateVersion = "24.11";
}
