{
  # java/kotlin editor
  # TODO: setup fully for spire mod dev
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = [pkgs.jetbrains.idea-oss];
  };
}
