{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.tandoor-recipes
  ];

  services.tandoor-recipes = {
    enable = true;
    #extraConfig = {};
    port = 8080;
    #port = 28983;
    #address = "localhost";
    address = "tandoor.local";
  };
}
