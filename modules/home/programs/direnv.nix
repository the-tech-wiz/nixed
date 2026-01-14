{
  flake.modules.homeManager.techwiz = {config, ...}:
  # automatic development environments.
  {
    programs.direnv = {
      enable = true;

      # only show which files are being loaded.
      config.global.log_filter = "^loading";

      # don't show timeout warning.
      config.global.warn_timeout = "0s";

      # enable nix-direnv for performance.
      nix-direnv.enable = true;
    };
  };
}
