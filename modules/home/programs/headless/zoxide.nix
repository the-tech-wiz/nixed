{
  flake.modules.homeManager.programs = {
    # automatic development environments.
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
