{ config, pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    logDir = "/mnt/nas/jellyfin/logDir";
    cacheDir = "/mnt/nas/jellyfin/cacheDir";
    openFirewall = true;
    dataDir = "/mnt/nas/jellyfin/dataDir";
    configDir = "/mnt/nas/jellyfin/configDir";
  };
}
