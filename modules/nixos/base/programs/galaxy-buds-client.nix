{
  flake.modules.nixos.base = {pkgs, ...}: {
    environment.systemPackages = [pkgs.galaxy-buds-client];
  };
}
