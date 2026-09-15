{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = [pkgs.kdePackages.kcalc];
  };
}
