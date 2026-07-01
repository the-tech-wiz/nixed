{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = [pkgs.wl-clipboard];
  };
}
