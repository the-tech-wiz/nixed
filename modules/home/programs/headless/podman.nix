{
  flake.modules.homeManager.programs = _: {
    services.podman = {
      enable = true;
    };
  };
}
