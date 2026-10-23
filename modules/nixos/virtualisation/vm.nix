{
  flake.modules.nixos.virtualization = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      quickemu
      distrobox
    ];
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
