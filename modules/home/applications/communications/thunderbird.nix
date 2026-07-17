{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;

    profiles."default" = {
      isDefault = true;
      settings = {
        "mail.uidensity" = 1;
        "ui.systemUsesDarkTheme" = 1;
        "app.update.auto" = false;
      };
    };
  };

  accounts.email.accounts = {
    "gmail" = {
      address = "odmamontov@gmail.com";
      realName = "Oleg Mamontov";
      primary = true;
      userName = "odmamontov@gmail.com";

      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
        tls.enable = true;
        tls.useStartTls = true;
      };

      thunderbird = {
        enable = true;
        profiles = [ "default" ];
        settings = id: {
          "mail.server.server_${id}.authMethod" = 10;
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
        };
      };
    };

    "mailru" = {
      address = "odmamontov@mail.ru";
      realName = "Oleg Mamontov";
      userName = "odmamontov@mail.ru";

      imap = {
        host = "imap.mail.ru";
        port = 993;
        tls.enable = true;
      };

      smtp = {
        host = "smtp.mail.ru";
        port = 465;
        tls.enable = true;
      };

      thunderbird = {
        enable = true;
        profiles = [ "default" ];
        settings = id: {
          "mail.server.server_${id}.authMethod" = 10;
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
        };
      };
    };
  };
}
