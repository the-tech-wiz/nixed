{
  perSystem = {pkgs, ...}: {
    config.pre-commit = {
      check.enable = true;
      settings.package = pkgs.prek;
      settings.hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
        statix.enable = true;
      };
    };
  };
}
