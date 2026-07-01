{inputs, ...}: {
  imports = with inputs; [
    flake-parts.flakeModules.modules
    git-hooks.flakeModule
    home-manager.flakeModules.home-manager
  ];
}
