{
  flake.modules.homeManager.techwiz = {config, ...}:
  # automatic development environments.
  {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
