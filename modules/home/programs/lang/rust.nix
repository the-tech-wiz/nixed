{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [rustc cargo clippy];
  };
}
