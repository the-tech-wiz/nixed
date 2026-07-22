{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    # brc modding
    environment.systemPackages = with pkgs; [r2modman];
  };
}
