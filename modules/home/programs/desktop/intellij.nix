{
  # java/kotlin editor
  # TODO: setup fully for spire mod dev
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = [pkgs.jetbrains.idea-oss];
  };
}
