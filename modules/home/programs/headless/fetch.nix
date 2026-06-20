{
  flake.modules.homeManager.software = {pkgs, ...}: {
    home.packages = [pkgs.pfetch-rs];
    home.sessionVariables = {
      PF_CUSTOM_LOGOS = "/home/techwiz/.config/pfetch-rs/pfetch-logo";
    };
  };
}
