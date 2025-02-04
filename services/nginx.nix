{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "paperless.local" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:28981"; # Paperless-ngx Dienst
        };
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
          proxy_buffering off;

        '';
      };
      "audiobookshelf.local" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:8000";
        };
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';

      };
      "jellyfin.local" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:8096";
        };
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
      "arm.local" = {
        locations."/index.html" = {
          proxyPass = "http://127.0.0.1:28982";
        };
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
      "tandoor.local" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:8080";
        };
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
    };
  };
}

