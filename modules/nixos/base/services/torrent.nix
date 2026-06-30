{
  flake.modules.nixos.base = _: {
    services.qbittorrent = {
      enable = true;
      webuiPort = 1337;
    };
  };
}
