{inputs, ...}: {
  flake.modules.homeManager.programs = {
    imports = with inputs; [
      nix-index-database.homeModules.default
    ];
    programs.nix-index.enable = true;
    # run any program without thinking about how it's installed
    programs.nix-index-database.comma.enable = true;
  };
}
