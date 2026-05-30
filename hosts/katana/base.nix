{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.techwiz =
    inputs.nixpkgs.lib.nixosSystem
    {
      modules = [
        self.modules.nixos.katana
        self.modules.nixos.base
        self.modules.nixos.gaming
      ];
    };

  flake.modules.nixos.katana = {
    config,
    pkgs,
    ...
  }: {
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.initrd.luks.devices."luks-f7afda07-35bc-402f-ab24-041c7fdc1ca4".device = "/dev/disk/by-uuid/f7afda07-35bc-402f-ab24-041c7fdc1ca4";
    networking.hostName = "katana"; # Define your hostname.

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Helsinki";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fi_FI.UTF-8";
      LC_IDENTIFICATION = "fi_FI.UTF-8";
      LC_MEASUREMENT = "fi_FI.UTF-8";
      LC_MONETARY = "fi_FI.UTF-8";
      LC_NAME = "fi_FI.UTF-8";
      LC_NUMERIC = "fi_FI.UTF-8";
      LC_PAPER = "fi_FI.UTF-8";
      LC_TELEPHONE = "fi_FI.UTF-8";
      LC_TIME = "fi_FI.UTF-8";
    };

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.techwiz = {
      isNormalUser = true;
      description = "TechWiz";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
    };
    # for default shell
    programs.fish.enable = true;

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    programs.neovim.enable = true;
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?

    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # services.xserver.enable = true;
    # Configure keymap in X11
    # services.xserver.xkb = {
    #   layout = "us";
    #   variant = "";
    # };
  };
}
