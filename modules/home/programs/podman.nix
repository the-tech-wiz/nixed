{
  flake.modules.homeManager.programs = {config, ...}: {
    services.podman = {
      enable = true;
    };
  };
}
