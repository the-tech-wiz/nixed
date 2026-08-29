{
  flake.modules.nixos.base = {
    nixpkgs.config.allowUnfree = true;

    services = {
      printing.enable = true;
      # audio
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };

    zramSwap.enable = true;

    # bare-minimum needed editor
    programs.neovim.enable = true;
  };
}
