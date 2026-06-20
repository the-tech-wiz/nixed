{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = [pkgs.wl-clipboard];
  };
}
