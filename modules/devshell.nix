{inputs, ...}: {
  imports = with inputs; [
    agenix-rekey.flakeModule
  ];

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

    agenix-rekey.agePackage = pkgs.age;
    devShells.default = pkgs.mkShellNoCC {
      inputsFrom = [
        config.pre-commit.devShell
      ];

      packages = with pkgs; [
        config.agenix-rekey.agePackage
        config.agenix-rekey.package
        age-plugin-yubikey
      ];

      shellHook = ''
        ${config.pre-commit.shellHook}
      '';
    };
  };
}
