{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.techwiz = {
    imports = with inputs; [
      home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      backupFileExtension = "bak";

      users.techwiz = {
        imports = with self.modules.homeManager; [
          styling
          programs
        ];

        home = {
          username = "techwiz";
          homeDirectory = "/home/techwiz";
          stateVersion = "26.05";
        };
      };
    };
  };
}
