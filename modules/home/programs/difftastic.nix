{
  flake.modules.homeManager.techwiz = {
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
