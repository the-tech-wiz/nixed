{
  flake.modules.nixos.base = {pkgs, ...}: {
    environment.systemPackages = [pkgs.wl-clipboard];
  };
}
