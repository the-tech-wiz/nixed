{
  flake.modules.homeManager.techwiz = {
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
      zoxide
      tldr

      typst

      # desktop
      # no modules? 🤨
      libreoffice-qt
      godot
      inkscape
      krita
      libresprite
    ];
  };
}
