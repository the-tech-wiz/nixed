{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixus.url = "git+https://codeberg.org/flippette/nixus";
    nixus.inputs = {
      flake-parts.follows = "flake-parts";
      home-manager.follows = "home-manager";
      nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    flake-parts,
    import-tree,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake
    {inherit inputs;}
    (import-tree [
      ./modules
    ]);
}
