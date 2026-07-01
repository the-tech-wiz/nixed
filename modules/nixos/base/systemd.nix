{
  flake.modules.nixos.base = {
    # speedup shutdown time
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
    systemd.user.settings.Manager.DefaultTimeoutStopSec = "10s";
  };
}
