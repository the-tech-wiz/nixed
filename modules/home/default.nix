{
  self,
  inputs,
  ...
}: {
  # for standalone h-m configurations
  flake.homeConfigurations.techwiz = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
    };

    modules = [
      self.modules.homeManager.styling
      self.modules.homeManager.programs
      self.modules.homeManager.services
      self.modules.homeManager.generic
      self.modules.homeManager.keys
      {
        home = {
          username = "techwiz";
          homeDirectory = "/home/techwiz";
          stateVersion = "26.05";
        };
      }
    ];
  };
}
