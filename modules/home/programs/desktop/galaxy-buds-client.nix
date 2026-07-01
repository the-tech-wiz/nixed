{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = [pkgs.galaxy-buds-client];
  };
}
