{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = [pkgs.galaxy-buds-client];
  };
}
