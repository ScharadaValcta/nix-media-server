{ config, pkgs, ... }:

{
  systemd.services.flake-update = {
    description = "Update NixOS System Flake";
    serviceConfig = {
      ExecStart = "${pkgs.nix}/bin/nix flake update && ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --upgrade --flake /home/mertins/nixos";
      Restart = "on-failure";
    };
  };

  systemd.timers.flake-update-timer = {
    description = "Timer for NixOS Flake Updates";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
