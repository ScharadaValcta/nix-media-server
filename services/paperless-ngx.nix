{ config, pkgs, ... }:

{
  services.paperless = {
    enable = true;
    mediaDir = "/mnt/nas/paperless/mediaDir";
    dataDir = "/mnt/nas/paperless/dataDir";
    passwordFile = "/mnt/nas/paperless/paperless-admin-pass";
    settings = {
      PAPERLESS_ADMIN_USER = "admin";
      PAPERLESS_ADMIN_PASSWORD = "admin";
      PAPERLESS_AUTO_LOGIN_USERNAME = "admin";
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STOR*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
      PAPERLESS_DATE_FORMAT = "%d.%m.%Y";
    };
    consumptionDirIsPublic = true;
    consumptionDir = "/mnt/nas/paperless/consume";
  };
}
