{inputs, ...}: {
  flake.modules.nixos.audio-video = {pkgs, ...}: {
    imports = [inputs.musnix.nixosModules.musnix]; # this line is wrong somehow, also should it even have rec?
    environment.systemPackages = with pkgs; [
      reaper
      audacity
      kdePackages.kdenlive
      obs-studio
    ];
    musnix = {
      enable = true;
      soundcardPciId = "00:1f.3";
      # CAUSES REBUILD EVERY KERNEL CHANGE
      # kernel.realtime = true;
      rtirq.enable = true;
    };
  };
}
