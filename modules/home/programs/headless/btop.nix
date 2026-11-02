{
  flake.modules.homeManager.programs = {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;

        proc_tree = true;
        proc_aggregate = true;
        proc_tree_auto_collapse = 5;
      };
    };
  };
}
