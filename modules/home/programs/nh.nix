{
  flake.modules.homeManager.techwiz = {config, ...}: {
    # Nix helper CLI.
    programs.nh = {
      enable = true;

      # enable automatic store cleanup.
      clean.enable = true;
    };
  };
}
