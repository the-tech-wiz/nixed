{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.katana =
    inputs.nixpkgs.lib.nixosSystem
    {
      modules = with self.modules.nixos; [
        base
        katana
        gaming
        virtualization
      ];
    };
}
