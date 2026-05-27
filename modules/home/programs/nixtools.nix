{
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      # Nix tooling

      alejandra # Nix formatter
      statix # Nix static analyser.
      nixd # Nix LSP.
      nil # backup Nix LSP (nixd growing pains)
    ];
    programs.nh = {
      enable = true;

      # enable automatic store cleanup.
      clean.enable = true;
    };
  };
}
