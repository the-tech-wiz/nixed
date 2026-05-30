{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [ungoogled-chromium];
  };
}
