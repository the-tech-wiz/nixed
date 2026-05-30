{lib, ...}: {
  flake.modules.nixos.gaming = {
    config,
    pkgs,
    ...
  }: {
    config.programs.gamemode.enable = true;
    config.programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs':
          with pkgs'; [
            # nvidia prime
            bumblebee
            primus
          ];
        # inherit
        #   (cfg)
        #   extraPkgs
        #   extraLibraries
        #   extraProfile
        #   extraPreBwrapCmds
        #   extraBwrapArgs
        #   extraArgs
        #   extraEnv
        #   ;
      };

      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
  # let in {
  #   options.nix.gaming.steam = let
  #     mergedStr = char:
  #       lib.types.str
  #       // {
  #         merge = _:
  #           lib.concatMapStringsSep char (s: s.value);
  #       };
  #   in {
  #     extraPkgs = lib.mkOption {
  #       type =
  #         lib.types.functionTo
  #         (lib.types.listOf lib.types.package);
  #       default = _: [];
  #       description = ''
  #         `extraPkgs` as accepted by `pkgs.steam.override`.
  #       '';
  #     };
  #
  #     extraLibraries = lib.mkOption {
  #       type =
  #         lib.types.functionTo
  #         (lib.types.listOf lib.types.package);
  #       default = _: [];
  #       description = ''
  #         `extraLibraries` as accepted by
  #         `pkgs.steam.override`.
  #       '';
  #     };
  #
  #     extraProfile = lib.mkOption {
  #       type = mergedStr "\n";
  #       default = "";
  #       description = ''
  #         `extraProfile` as accepted by
  #         `pkgs.steam.override`.
  #
  #         Definitions of this option will be concatenated
  #         together, separated by newlines. Ordering is
  #         undefined.
  #       '';
  #     };
  #
  #     extraPreBwrapCmds = lib.mkOption {
  #       type = mergedStr "\n";
  #       default = "";
  #       description = ''
  #         `extraPreBwrapCmds` as accepted by
  #         `pkgs.steam.override`.
  #
  #         Definitions of this option will be concatenated
  #         together, separated by newlines. Ordering is
  #         undefined.
  #       '';
  #     };
  #
  #     extraBwrapArgs = lib.mkOption {
  #       type = lib.types.listOf lib.types.str;
  #       default = [];
  #       description = ''
  #         `extraBwrapArgs` as accepted by
  #         `pkgs.steam.override`.
  #       '';
  #     };
  #
  #     extraArgs = lib.mkOption {
  #       type = mergedStr " ";
  #       default = "";
  #       description = ''
  #         `extraArgs` as accepted by `pkgs.steam.override`.
  #
  #         Definitions of this option will be concatenated
  #         together, separated by spaces. Ordering is
  #         undefined.
  #       '';
  #     };
  #
  #     extraEnv = lib.mkOption {
  #       type = lib.types.attrs;
  #       default = {};
  #       description = ''
  #         `extraEnv` as accepted by `pkgs.steam.override`.
  #       '';
  #     };
  #   };
}
