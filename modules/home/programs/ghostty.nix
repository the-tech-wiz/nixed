{
  flake.modules.homeManager.techwiz = {
    programs.ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
        window-decoration = "server";
        maximize=true;
        window-padding-x = 0;
        window-padding-y = 0;
        window-padding-balance = true;
      };
    };
  };
}
