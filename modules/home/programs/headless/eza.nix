{
  flake.modules.homeManager.programs = _: {
    # `ls` clone with extra features.
    programs.eza = {
      enable = true;

      # extra flair.
      colors = "auto";
      git = true;
      icons = "auto";
    };
  };
}
