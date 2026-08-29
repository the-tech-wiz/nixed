{inputs, ...}: {
  flake.modules.homeManager.keys = let
    root = ../../secrets;
    homeDir = /home/techwiz;
  in {
    imports = with inputs; [
      agenix.homeManagerModules.default
      agenix-rekey.homeManagerModules.default
    ];

    age = {
      rekey.storageMode = "local";
      rekey.masterIdentities = [
        (root + identities/yk5n-32855007.pub)
        (root + identities/yk5n-32855004.pub)
      ];

      identityPaths = [
        "${homeDir}/.ssh/agenix.id_ed25519"
      ];
    };
  };
}
