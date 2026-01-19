{
  inputs,
  lib,
  ...
}: {
  flake.modules.homeManager.styling = {
    imports = [
      inputs.nixus.modules.homeManager.styling
    ];

    # here because styling needs desktop to style
    options.nixus.desktop.enable = lib.mkEnableOption "guh";

    # overrides to taste
    config = {
      # here too
      nixus.desktop.enable = true;
      nixus.styling = {
        enable = true;
        cursors.name = "Bibata-Modern-Ice";

        colors.catppuccin.accent = "sapphire";
        fonts.sizes.terminal = 14;
      };
    };
  };
}
