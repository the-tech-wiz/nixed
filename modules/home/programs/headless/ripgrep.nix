{
  flake.modules.homeManager.software = _: {
    # faster `grep` clone.
    programs.ripgrep.enable = true;

    # `ripgrep`, but for extra formats.
    programs.ripgrep-all.enable = true;
  };
}
