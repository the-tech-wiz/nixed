{
  flake.modules.homeManager.programs = {config, ...}:
  {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
