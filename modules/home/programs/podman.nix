{
  flake.modules.homeManager.techwiz = {config, ...}: {
    services.podman = {
      enable = true;
    };
  };
}
