{}
# {
#   flake.modules.homeManager.styling = {
#     config,
#     pkgs,
#     ...
#   }: let
#     inherit
#       (config.nixus.styling.colors)
#       catppuccin
#       polarity
#       ;
#     inherit (catppuccin) accent;
#
#     variant =
#       if polarity == "dark"
#       then catppuccin.flavors.dark
#       else if polarity == "light"
#       then catppuccin.flavors.light
#       else throw "invalid flavor `${polarity}`";
#     name = "catppuccin-${variant}-${accent}-standard";
#     package = pkgs.catppuccin-gtk.override {
#       accents = [accent];
#       inherit variant;
#     };
#   in {
#     gtk.colorScheme = polarity;
#     gtk.theme = {inherit name package;};
#
#     xdg.dataFile."themes/${name}" = {
#       source = "${package}/share/themes/${name}";
#     };
#   };
# }

