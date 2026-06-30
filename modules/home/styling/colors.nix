{inputs, ...}: {
  flake.modules.homeManager.styling = {
    config,
    pkgs,
    ...
  }: {
    imports = [inputs.catppuccin.homeModules.catppuccin];
    catppuccin = {
      autoEnable = true;
      enable = true;
      flavor = "mocha";
      accent = "sky";
    };
  };
}
