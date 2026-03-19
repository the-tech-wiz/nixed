{
  flake.modules.homeManager.programs = {config, ...}: {
    # email client.
    programs.thunderbird = {
      enable = true;
    };
  };
}
