{
  flake.modules.homeManager.software = _:
  {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
