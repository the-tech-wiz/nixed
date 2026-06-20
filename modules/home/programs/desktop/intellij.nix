{
  # backup code editor for java chicanery
  # TODO: setup fully for spire mod dev
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = [pkgs.jetbrains.idea-oss];
  };
}
