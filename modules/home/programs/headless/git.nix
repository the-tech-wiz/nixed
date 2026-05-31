{
  flake.modules.homeManager.programs = _: {
    # the friendly interactive shell.
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "techwiz";
          email = "thetechwizard@proton.me";
          signingKey = "";
        };
        core.autocrlf = false;
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
      signing = {
        format = "ssh";
        signByDefault = true;
      };
    };
    programs.lazygit = {
      enable = true;
      settings = {};
    };
  };
}
