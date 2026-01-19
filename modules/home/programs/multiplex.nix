{
  flake.modules.homeManager.techwiz = {config, ...}: {
    # modern shell prompt.
    programs.zellij = {
      enable = true;
    };
    # for compat purposes
    programs.tmux.enable = true;
  };
}
