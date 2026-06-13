{
  flake.nixos.modules.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [prismlauncher];
  };
}
