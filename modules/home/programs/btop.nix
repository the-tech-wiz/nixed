{
  flake.modules.homeManager.techwiz = {config, ...}:
  {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
