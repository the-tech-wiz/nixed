{
  flake.modules.homeManager.techwiz = {config, ...}: {
    # modern shell prompt.
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;
      };
    };
  };
}
