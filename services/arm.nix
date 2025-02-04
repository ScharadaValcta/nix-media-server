{ pkgs, lib, ... }:

{
  users.users.arm = {
    isNormalUser = true;        # Erstelle einen normalen Benutzer
    home = "/mnt/nas/arm";      # Home-Verzeichnis
    group = "arm";              # Primäre Gruppe
    extraGroups = [ "wheel" ];  # Optionale zusätzliche Gruppen (z. B. für sudo-Zugriff)
    shell = pkgs.zsh;           # Benutzer-Shell (z. B. zsh oder bash)
  };

  users.groups.arm = {
    gid = 1001;                         # Optional: spezifische GID
  };

  # Runtime
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  virtualisation.oci-containers.backend = "docker";

  # Containers
  virtualisation.oci-containers.containers."arm-ripper" = {
    #user = "arm:arm";
    #pull = "always";
    image = "automaticrippingmachine/automatic-ripping-machine:latest";
    #ports = [ "8080:8080" ];
    ports = [ "28982:8080" ];
    environment = {
      ARM_UID = "1001";
      ARM_GID = "1001";
    };
    volumes = [
      "/mnt/nas/arm:/home/arm"
      "/mnt/nas/arm/Music:/home/arm/Music"
      "/mnt/nas/arm/logs:/home/arm/logs"
      "/mnt/nas/arm/media:/home/arm/media"
      "/mnt/nas/arm/config:/etc/arm/config"
    ];
    devices = [
      "/dev/sr0:/dev/sr0"
      "/dev/sr1:/dev/sr1"
      "/dev/sr2:/dev/sr2"
      "/dev/sr3:/dev/sr3"
    ];
    privileged = true;
    autoStart = true;
  };
}
