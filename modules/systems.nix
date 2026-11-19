{inputs, ...}: {
  systems = [
    "x86_64-linux"
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs-stable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  };
}
