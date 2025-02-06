{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.podgrab
  ];
  services.podgrab = {
    enable = true;
    port = 28984;
    group = "users";
    #dataDirectory = "/mnt/nas/podgrab/dataDir";
    dataDirectory = "/mnt/nas/media/audiobooks";
  };
}
