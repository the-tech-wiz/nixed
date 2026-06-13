{inputs, ...}: {
  flake.modules.nixos.base = _: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      packages = [
        "com.protonvpn.www"
      ];
    };
  };
}
