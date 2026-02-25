{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations.techwiz = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
    };

    modules = [
      self.modules.homeManager.styling
      self.modules.homeManager.programs
      self.modules.homeManager.generic
      {
        home = {
          username = "techwiz";
          homeDirectory = "/home/techwiz";
          stateVersion = "25.11";
        };
      }
    ];
  };
}
