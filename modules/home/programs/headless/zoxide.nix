{
  flake.modules.homeManager.software = _:
  # automatic development environments.
  {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
