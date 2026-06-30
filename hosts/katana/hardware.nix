{
  flake.modules.nixos.katana = {
    config,
    lib,
    ...
  }: {
    hardware = {
      facter.reportPath = ./.facter.json;
      xpadneo.enable = true;
      cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
    boot = {
      initrd = {
        availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
        kernelModules = [];
        luks.devices."luks-a029b766-fade-4505-8cfa-43e6f3926c28".device = "/dev/disk/by-uuid/a029b766-fade-4505-8cfa-43e6f3926c28";
        luks.devices."luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4".device = "/dev/disk/by-uuid/f7afda07-35bc-402f-ab24-041c7fdc1ca4";
      };
      kernelModules = ["kvm-intel"];
      extraModulePackages = [];
    };

    fileSystems."/" = {
      device = "/dev/mapper/luks-a029b766-fade-4505-8cfa-43e6f3926c28";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/1A73-ABEC";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/mapper/luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
