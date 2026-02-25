{
  flake.modules.homeManager.programs = {config, ...}: {
    # modern shell prompt.
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;
        format = "$directory$git_branch$git_status$character";
      };
    };
  };
}
