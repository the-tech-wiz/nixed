{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    config.programs.gamemode.enable = true;
    config.programs.steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
