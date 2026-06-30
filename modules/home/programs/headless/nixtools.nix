{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = with pkgs; [
      # Nix tooling

      alejandra # Nix formatter
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
