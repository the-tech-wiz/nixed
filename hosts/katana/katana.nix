{
  flake.modules.nixos.katana = {
    pkgs,
    lib,
    ...
  }: let
    useCaches = caches: {
      substituters = map (c: c.url) caches;
      trusted-public-keys =
        lib.concatMap (c: c.keys) caches;
    };
  in {
    networking.hostName = "katana";

    # user account
    users.users.techwiz = {
      isNormalUser = true;
      description = "TechWiz";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
    };

    # for default shell
    programs.fish.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?

    nix.settings =
      {
        trusted-users = ["root" "@wheel"];
        experimental-features = ["nix-command" "flakes" "coerce-integers" "pipe-operator"];
      }
      // useCaches [
        {
          url = "https://nix-community.cachix.org";
          keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
        }

        {
          url = "https://afnix-hydra.s3-bulk-web.afnix.fr";
          keys = ["afnix:oqt801y+IwJ09XRtNDQYCKb7zuCw9DQXQk8fDWPkwxM="];
        }
      ];
  };
}
