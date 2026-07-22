{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    # compat for ark
    home.packages = with pkgs; [
      kdePackages.ark
      unar
    ];
  };
}
