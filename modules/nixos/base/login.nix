{
  flake.modules.nixos.base = {pkgs, ...}: {
    services.displayManager = {
      plasma-login-manager.enable = true;
      autoLogin.user = "techwiz";
    };

    # autologin using 1 password for LUKS, KDE autologin and password
    boot.initrd.systemd.enable = true;
    systemd.services.plasmalogin.serviceConfig.KeyringMode = "inherit";
    security.pam.services.plasmalogin-autologin.rules.auth = {
      systemd_loadkey = {
        order = 0;
        control = "optional";
        modulePath = "${pkgs.systemd}/lib/security/pam_systemd_loadkey.so";
      };
      plasmalogin = {
        order = 1;
        control = "include";
        modulePath = "plasmalogin";
      };
    };
  };
}
