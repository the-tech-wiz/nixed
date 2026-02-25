{
  flake.modules.homeManager.programs = {config, ...}:
  # automatic development environments.
  {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
