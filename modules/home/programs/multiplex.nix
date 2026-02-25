{
  flake.modules.homeManager.programs = {config, ...}: {
    # modern shell prompt.
    programs.zellij = {
      enable = true;
    };
    # for compat purposes
    programs.tmux.enable = true;
  };
}
