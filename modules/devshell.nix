{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    pre-commit = {
      check.enable = true;
      settings.package = pkgs.prek;
      settings.hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
        statix.enable = true;
      };
    };

    devShells.default = pkgs.mkShell {
      inputsFrom = [
        config.pre-commit.devShell
      ];

      shellHook = ''
        ${config.pre-commit.shellHook}
      '';
    };
  };
}
