{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = with pkgs; [obsidian];
  };
}
