{
  flake.modules.nixos.katana = {
    config,
    lib,
    pkgs,
    ...
  }: {
    hardware = {
      facter.reportPath = ./.facter.json;
      xpadneo.enable = true;
      cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
    boot = {
      kernelParams = ["nvme_core.default_ps_max_latency_us=0" "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "ec_sys.write_support=1"];
      initrd = {
        availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
        kernelModules = [];
        luks.devices."luks-a029b766-fade-4505-8cfa-43e6f3926c28".device = "/dev/disk/by-uuid/a029b766-fade-4505-8cfa-43e6f3926c28";
        luks.devices."luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4".device = "/dev/disk/by-uuid/f7afda07-35bc-402f-ab24-041c7fdc1ca4";
      };

      kernelPackages = pkgs.linuxPackages_zen;
      extraModulePackages = with config.boot.kernelPackages; [msi-ec acpi_call];
      kernelModules = ["kvm-intel" "msi-ec" "acpi_call" "ec_sys"];

      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;

      zswap.enable = true;
      zswap.maxPoolPercent = 50;
      kernel.sysctl."vm.swappiness" = lib.mkForce 100;

      kernel.sysctl."kernel.sysrq" = 1;
    };

    fileSystems."/" = {
      device = "/dev/mapper/luks-a029b766-fade-4505-8cfa-43e6f3926c28";
      fsType = "ext4";
      options = ["noatime"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/1A73-ABEC";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/mapper/luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4";}
    ];

    environment.systemPackages = with pkgs; [mcontrolcenter];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
