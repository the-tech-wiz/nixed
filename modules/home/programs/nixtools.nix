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
      nixd # Nix LSP.
    ];
    programs.nh = {
      enable = true;

      # enable automatic store cleanup.
      clean.enable = true;
    };
  };
}
