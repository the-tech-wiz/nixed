{
  flake.modules.homeManager.styling = {pkgs, ...}: let
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  in {
    gtk.iconTheme = {inherit name package;};
    qt.qt5ctSettings.Appearance.icon_theme = name;
    qt.qt6ctSettings.Appearance.icon_theme = name;
    xdg.dataFile."icons/${name}" = {
      source = "${package}/share/icons/${name}";
    };

    # cursors
    home.pointerCursor = {
      enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 28;
    };
  };
}
