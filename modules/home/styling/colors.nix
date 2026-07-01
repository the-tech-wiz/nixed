{inputs, ...}: {
  flake.modules.homeManager.styling = {
    imports = [inputs.catppuccin.homeModules.catppuccin];
    catppuccin = {
      autoEnable = true;
      enable = true;
      flavor = "mocha";
      accent = "sky";
    };
  };
}
