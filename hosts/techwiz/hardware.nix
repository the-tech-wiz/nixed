{
  flake.modules.nixos.techwiz = 
    { config, lib, pkgs, modulesPath, ... }:

    {
      hardware.facter.reportPath = ./.facter.json;

      boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" =
        { device = "/dev/mapper/luks-a029b766-fade-4505-8cfa-43e6f3926c28";
          fsType = "ext4";
        };

      boot.initrd.luks.devices."luks-a029b766-fade-4505-8cfa-43e6f3926c28".device = "/dev/disk/by-uuid/a029b766-fade-4505-8cfa-43e6f3926c28";

      fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/1A73-ABEC";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
        };

      swapDevices =
        [ { device = "/dev/mapper/luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4"; }
        ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}

