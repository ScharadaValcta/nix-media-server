{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.tandoor-recipes
  ];

  services.tandoor-recipes = {
    enable = true;
    #extraConfig = {};
    port = 28982;
    address = "localhost";
    #address = "tandoor.local";
  };
}
