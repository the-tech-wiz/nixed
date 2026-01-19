{
  flake.modules.homeManager.techwiz = {config, ...}: {
    # modern shell prompt.
    programs.zellij = {
      enable = true;
    };
  };
}
