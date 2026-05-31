{
  flake.modules.homeManager.programs = _: {
    # the friendly interactive shell.
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "techwiz";
            email = "thetechwizard@proton.me";
          };
          core.autocrlf = false;
          init.defaultBranch = "main";
          push.autoSetupRemote = true;
        };
        signing = {
          format = "ssh";
          signByDefault = true;
          key = "/home/techwiz/.ssh/id_ed25519";
        };
      }; # syntax-aware diff
      difftastic = {
        enable = true;
        git = {
          enable = true;
          diffToolMode = true;
        };
      };
      lazygit = {
        enable = true;
        settings = {
          git.pagers.useExternalDiffGitConfig = true;
        };
      };
    };
  };
}
