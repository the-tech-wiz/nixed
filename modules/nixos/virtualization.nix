{lib, ...}: {
  flake.modules.nixos.virtualization = {
    config,
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      quickemu
    ];
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
