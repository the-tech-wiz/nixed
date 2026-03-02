{
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      # Nix
      alejandra # Nix formatter
      tokei # code line counter.
      statix # Nix static analyser.

      # cli
      dust # disk usage visualiser.
      fd
      lazygit
      tldr
      bat
      erdtree
      pfetch-rs

      typst

      ## desktop
      # no modules? 🤨
      # creative
      libreoffice-qt
      godot
      inkscape
      krita
      libresprite
      # math
      scilab-bin
      octaveFull
      # other
      gnome-boxes
    ];
  };
}
