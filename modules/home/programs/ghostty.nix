{
  flake.modules.homeManager.techwiz = {
    programs.ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
        window-decoration = "server";
      };
    };
  };
}
