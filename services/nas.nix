{ config, pkgs, ... }:

{
  services.nfs.server = {
    enable = true;
    exports = ''
      /mnt/nas *(rw,sync,no_subtree_check,no_root_squash)
    '';
  };
}
