{inputs, ...}: {
  flake.modules.nixos.base = {pkgs, ...}: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      packages = [
        "com.protonvpn.www"
        "org.signal.Signal"
      ];
      overrides.settings = {
        global = {
          Environment = {
            # Fix un-themed cursor in some Wayland apps
            # XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

            # Force correct theme for some GTK apps
            GTK_THEME = "Adwaita:dark";
          };
        };
        "org.signal.Signal".Environment = {
          # change if using different keyring
          SIGNAL_PASSWORD_STORE = "kwallet";
        };
      };
    };
  };
}
