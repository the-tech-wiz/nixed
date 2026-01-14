{
  flake.modules.homeManager.techwiz = {config, ...}: {
    # faster `grep` clone.
    programs.ripgrep.enable = true;

    # `ripgrep`, but for extra formats.
    programs.ripgrep-all.enable = true;
  };
}
