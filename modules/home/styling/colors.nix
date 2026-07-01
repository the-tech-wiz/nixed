{inputs, ...}: {
  flake.modules.homeManager.styling = _: {
    imports = [inputs.catppuccin.homeModules.catppuccin];
    catppuccin = {
      autoEnable = true;
      enable = true;
      flavor = "mocha";
      accent = "sky";
    };
  };
}
