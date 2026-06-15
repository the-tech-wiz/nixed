{inputs, ...}: {
  flake.modules.homeManager.styling = {
    config,
    pkgs,
    ...
  }: let
    flavor = "mocha";
    accent = "sky";
  in {
    imports = [inputs.catppuccin.homeModules.catppuccin];
    catppuccin = {
      autoEnable = true;
      enable = true;
      # antigravity.enable = false;
      # qt5ct.enable = true;
      # vscode.profiles.default.enable = false;
      # vscodium.profiles.default.enable = false;

      inherit accent flavor;

      # Catppuccin's GTK module is basically dead, disable
      # it until this issue is resolved.
      #
      # <https://github.com/catppuccin/gtk/issues/262>
      # gtk.icon.enable = false;
    };
    # programs.vscodium.profiles.default = {
    #   extensions = with pkgs.vscode-extensions; [catppuccin.catppuccin-vsc];
    #   userSettings = {"catppuccin.accentColor" = accent;};
    # };
  };
}
