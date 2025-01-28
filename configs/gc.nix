{
  nix.gc = {
    automatic = true;
    dates = "daily"; # Garbage Collection wird täglich ausgeführt
    options = "--delete-older-than 30d"; # Optional: Behalte nur Generations, die jünger als 30 Tage sind
  };

  nix.settings.keep-derivations = false;
  nix.settings.keep-outputs = false;

  #systemd.services.nix-gc = {
  #  description = "Nix Garbage Collection";
  #  serviceConfig.ExecStart = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than 3d";
  #};

  #systemd.timers.nix-gc = {
  #  description = "Run Nix Garbage Collection Regularly";
  #  wantedBy = [ "timers.target" ];
  #  timerConfig.OnCalendar = "daily";
  #  timerConfig.Persistent = true;
  #};
}
