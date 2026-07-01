{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    config.programs.gamemode.enable = true;
    config.programs.steam = {
      enable = true;

      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
