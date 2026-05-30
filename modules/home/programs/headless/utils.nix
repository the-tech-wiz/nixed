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
      fd # better fd
      bat # better cat
      erdtree # better tree
      tailspin # log colorizer
      tldr # clean man
    ];
  };
}
