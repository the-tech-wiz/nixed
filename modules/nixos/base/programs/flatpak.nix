{inputs, ...}: {
  flake.modules.nixos.base = {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      packages = [
        "com.protonvpn.www"
        "org.signal.Signal"
        "net.ankiweb.Anki"
      ];
      overrides.settings = {
        global = {
          Environment = {
            # Fix un-themed cursor in some Wayland apps
            # XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

            # Force correct theme for some GTK apps
            GTK_THEME = "Adwaita:dark";
          };
          Context = {
            filesystems = "/home/techwiz/.icons:ro;/nix/store:ro;/home/techwiz/.local/share/fonts:ro;/run/current-system/sw/share/X11/fonts:ro;";
          };
        };
        "org.signal.Signal".Environment = {
          # change if using different keyring
          SIGNAL_PASSWORD_STORE = "kwallet";
        };
      };
    };
    # allow flatpak font access
    fonts.fontDir.enable = true;
  };
}
