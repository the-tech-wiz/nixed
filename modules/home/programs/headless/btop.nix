{
  flake.modules.homeManager.programs = {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
