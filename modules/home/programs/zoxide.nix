{
  flake.modules.homeManager.techwiz = {config, ...}:
  # automatic development environments.
  {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
