{
  flake.modules.homeManager.techwiz = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      dust # disk usage visualiser.
      statix # Nix static analyser.
      tokei # code line counter.
      alejandra
    ];
  };
}
