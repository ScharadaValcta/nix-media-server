# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./shell.nix 
      ./gc.nix
      ./auto-update.nix
      ../services/nginx.nix
      ../services/paperless-ngx.nix
      ../services/nas.nix
      ../services/audiobookshelf.nix
      ../services/jellyfin.nix
      ../services/arm.nix
      ../services/tandoor.nix
      ../services/printing.nix 
      ../services/immich.nix 
      #../services/podgrab.nix
    ];

  fileSystems."/mnt/nas" = {
    device = "/dev/sdb1";
    fsType = "ext4";
  };

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mertins = {
    isNormalUser = true;
    description = "mertins";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neofetch ];
    shell = pkgs.zsh;
  };


  nix.settings.experimental-features = ["nix-command" "flakes"];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    oh-my-zsh
  ];

  networking.hostName = "media-server"; # Define your hostname.

  # Enable networking and Open ports in the firewall.
  networking.networkmanager.enable = true;
  networking = {
    firewall.allowedTCPPorts = [ 80 443 631 111 2049 8000 8080 28981 28982 28983 28984 ];
    firewall.allowedUDPPorts = [ 111 2049 ];
  }; 
  # 80 443 -> HTTP und HTTPS
  # 111 2049 -> NAS nfs
  # 631 -> printing
  # 8000 -> audiobookshelf
  # 28981 -> paperless-ngx
  # 8080 28982 -> arm
  # 8080 28983 -> tandoor
  # 28984 -> podgrab

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
