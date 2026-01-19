{
  flake.modules.homeManager.techwiz = {
    config,
    pkgs,
    ...
  }: {
    # the friendly interactive shell.
    # TODO this in full w my config
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

          # show system information.
          pfetch
        '';
    };
  };
}
