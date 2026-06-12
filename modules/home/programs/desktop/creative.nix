{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [
      # creative and media software
      libreoffice-qt
      godot
      inkscape
      krita
      libresprite
      blender
    ];
  };
}
