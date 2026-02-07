{
  flake.modules.homeManager.techwiz = {
    programs.ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
        window-decoration = "server";
        window-height = 10000;
        window-width = 10000;
        window-position-x = 0;
        window-position-y = 0;
      };
    };
  };
}
