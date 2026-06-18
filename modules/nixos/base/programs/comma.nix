{
  flake.modules.nixos.base = {pkgs, ...}: {
    # run any program without thinking about how it's installed
    environment.systemPackages = with pkgs; [comma];
  };
}
