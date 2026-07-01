{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [
      tokei # code line counter.
      dua # TUI disk usage manager.
      fd # better find
      bat # better cat
      erdtree # better tree
      tailspin # log colorizer
      tldr # clean man
    ];
  };
}
