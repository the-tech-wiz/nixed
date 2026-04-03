{
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
      home.packages = with pkgs; [
      # Nix tooling

      alejandra # Nix formatter
      tokei # code line counter.
      statix # Nix static analyser.
      nil # Nix language server.
      ];
    };
}
