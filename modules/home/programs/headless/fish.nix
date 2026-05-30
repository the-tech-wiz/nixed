{
  flake.modules.homeManager.programs = _: {
    # the friendly interactive shell.
    programs.fish = {
      enable = true;

      interactiveShellInit =
        # fish
        ''
          # disable the greeting.
          set -g fish_greeting
          # aliases
          alias du dust
          alias tree erd
          alias rq 'dnf repoquery'
          set EDITOR nvim

          # show system information.
          fastfetch
        '';
    };
  };
}
