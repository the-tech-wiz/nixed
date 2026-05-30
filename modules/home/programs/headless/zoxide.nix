{
  flake.modules.homeManager.programs = _:
  # automatic development environments.
  {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
