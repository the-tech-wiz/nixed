{inputs, ...}: {
  flake.modules.nixos.base = {pkgs, ...}: let
    root = ../../../secrets;
  in {
    # agenix
    imports = with inputs; [
      agenix.nixosModules.default
      agenix-rekey.nixosModules.default
    ];

    age.rekey = {
      storageMode = "local";
      masterIdentities = [
        (root + identities/yk5n-32855007.pub)
        (root + identities/yk5n-32855004.pub)
      ];

      hostPubkey = root + /nixos/katana/ssh_host_ed25519_key.pub;
      localStorageDir =
        root + /nixos/katana/rekeyed;
    };

    # yubikey
    services = {
      pcscd.enable = true;
    };
    environment.systemPackages = with pkgs; [
      yubikey-manager
    ];
  };
}
