{
  flake.modules.nixos.base = {
    services.keyd = {
      enable = true;
      keyboards = {
        # The name is just the name of the configuration file, it does not really matter
        default = {
          ids = ["*"]; # what goes into the [id] section, here we select all keyboards
          # Everything but the ID section:
          settings = {
            # The main layer, if you choose to declare it in Nix
            main = {
              pageup = "sysrq";
              capslock = "overload(control,esc)"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
            };

            control = {
              a = "ä";
              o = "ö";
              e = "€";
            };
            "shift+control" = {
              o = "Ö";
              a = "Ä";
              e = "€";
            };
          };
          extraConfig = ''
            # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
            # grumble grumble the archaic keys the graphics course needs fsr
            # kp1 = end
            # kp3 = pagedown
            # kp7 = home
            # kp9 = pageup                    '';
        };
      };
    };
  };
}
