{
  flake.modules.nixos.base = {
    # Bootloader.
    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
    };
  };
}
