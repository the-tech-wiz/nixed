{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = with pkgs; [ungoogled-chromium tor-browser];
  };
}
