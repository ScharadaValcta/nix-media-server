{ config, pkgs, ... }:

{
  services.immich = {
    enable = true;
    port = 2283;
    #host = "localhost";
    database = {
      user = "immich";
      name = "immich";
    };
    user = "immich";
    group = "immich";
    openFirewall = true;
    #settings = {}
    mediaLocation = "/mnt/nas/immich/mediaLocation"
  };
}
