{ config, pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint hplip ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  environment.systemPackages = with pkgs; [
    usbutils
    sane-backends
    sane-frontends
    simple-scan
  ];

#  services.podgrab = {
#    enable = true;
#    port = 28984;
#    group = "users";
#    #dataDirectory = "/mnt/nas/podgrab/dataDir";
#    dataDirectory = "/mnt/nas/media/audiobooks";
#  };
}
