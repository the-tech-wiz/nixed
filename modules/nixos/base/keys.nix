{
  flake.modules.nixos.base = {pkgs, ...}: {
    services = {
      pcscd.enable = true;
    };
    environment.systemPackages = with pkgs; [
      yubikey-manager
    ];
  };
}
