{
  flake.modules.homeManager.programs = _:
  {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
