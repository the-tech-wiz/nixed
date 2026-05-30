{
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
    # syntax-aware diff
    programs.difftastic = {
      enable = true;
      git = {
        enable = true;
        diffToolMode = true;
      };
    };
  };
}
