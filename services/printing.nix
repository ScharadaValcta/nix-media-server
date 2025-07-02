{ config, pkgs, ... }:

{
  services = {
    saned.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint hplip ];
      listenAddresses = [ "*:631" ];
      extraConf = ''
        # Lauscht auf allen Interfaces
        Listen 0.0.0.0:631
        Listen [::]:631
        # Erlaubt Netzwerk-Browsing
        Browsing On
        BrowseLocalProtocols dnssd
        # Erlaubt Zugriff von überall (für Testzwecke, später ggf. einschränken)
        <Location />
          Order allow,deny
          Allow all
        </Location>
        <Location /admin>
          AuthType Default
          Require valid-user
          Order allow,deny
          Allow all
        </Location>
        <Location /admin/conf>
          AuthType Default
          Require valid-user
          Order allow,deny
          Allow all
        </Location>
      '';
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
