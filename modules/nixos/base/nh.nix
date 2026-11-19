{
  flake.modules.nixos.base = {
    programs.nh = {
      enable = true;

      # enable automatic store cleanup.
      clean.enable = true;
      clean.extraArgs = "--keep 3 --optimise";
    };
  };
}
