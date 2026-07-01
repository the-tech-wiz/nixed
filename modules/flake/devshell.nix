{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      inputsFrom = [
        config.pre-commit.devShell
      ];

      shellHook = ''
        ${config.pre-commit.shellHook}
      '';
    };
  };
}
