{
  flake.modules.homeManager.programs = _: {
    # the friendly interactive shell.
    programs.git = {
      enable = true;
      settings = {
        user.name = "techwiz";
        user.email = "thetechwizard@proton.me";
      };
    };
    programs.lazygit = {
      enable = true;
      settings = {};
    };
  };
}
