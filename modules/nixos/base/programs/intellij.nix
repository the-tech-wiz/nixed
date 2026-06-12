{
  # backup code editor for java chicanery
  # TODO: setup fully for spire mod dev
  flake.modules.nixos.base = {pkgs, ...}: {
    environment.systemPackages = [pkgs.jetbrains.idea-oss];
  };
}
