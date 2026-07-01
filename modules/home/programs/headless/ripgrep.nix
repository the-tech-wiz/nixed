{
  flake.modules.homeManager.programs = {
    # faster `grep` clone.
    programs.ripgrep.enable = true;

    # `ripgrep`, but for extra formats.
    programs.ripgrep-all.enable = true;
  };
}
