{
  # backup code editor for java chicanery
  # TODO: setup fully for spire mod dev
  flake.modules.homeManager.programs = {pkgs, ...}: {
    programs.idea-oss = {
      enable = true;
    };
  };
}
