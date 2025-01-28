{ config, pkgs, ... }:

{
  services.audiobookshelf = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
#    dataDir = "/mnt/nas/paperless/dataDir";
  };
}
