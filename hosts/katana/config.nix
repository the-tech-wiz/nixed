{
  self,
  inputs,
  withSystem,
  ...
}: let
  system = "x86_64-linux";
in {
  flake.nixosConfigurations.katana = withSystem system ({pkgs-stable, ...}:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs pkgs-stable;
      };

      modules =
        [
          {
            nixpkgs.hostPlatform = system;
            home-manager.extraSpecialArgs = {inherit pkgs-stable;};
          }
        ]
        ++ (with self.modules.nixos; [
          base
          katana
          gaming
          virtualization
          audio-video
        ]);
    });
}
