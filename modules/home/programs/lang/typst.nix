{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [
      typst
      tinymist
      typstyle
    ];
  };
}
