{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.tandoor-recipes
  ];

  services.tandoor-recipes = {
    enable = true;
    extraConfig = {
      GUNICORN_MEDIA = true;
    };
    port = 28983;
    address = "0.0.0.0";
  };
}
