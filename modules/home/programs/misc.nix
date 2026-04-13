{
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      # cli

      tokei # code line counter.
      dust # disk usage visualiser.
      fd
      lazygit
      tldr
      bat
      erdtree
      pfetch-rs

      typst

      ungoogled-chromium
      octaveFull

      age
    ];
  };
}
