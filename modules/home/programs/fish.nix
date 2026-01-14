{
  flake.modules.homeManager.techwiz = {
    config,
    pkgs,
    ...
  }: {
    # the friendly interactive shell.
    # TODO this in full w my config
    # programs.fish = {
    #   enable = true;
    #
    #   interactiveShellInit =
    #     # fish
    #     ''
    #       # disable the greeting.
    #       set -g fish_greeting
    #
    #       # show system information.
    #     '';
    # };
  };
}
