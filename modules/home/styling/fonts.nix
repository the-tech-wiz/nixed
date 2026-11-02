{
  flake.modules.homeManager.styling = {
    pkgs,
    lib,
    ...
  }: let
    sizes = {
      apps = 10;
      desktop = 10;
      popups = 10;
      terminal = 14;
    };
    defaults = {
      serif = ["Libre Baskerville"];
      sansSerif = ["Inter Variable"];
      monospace = ["IosevkaTerm Nerd Font"];
      emoji = ["Twitter Color Emoji"];
    };
    defaultPackages = with pkgs; [
      libre-baskerville
      inter
      nerd-fonts.iosevka-term
      twitter-color-emoji
    ];
    qtctSettings.Fonts = {
      general = defaults.sans-serif;
      fixed = defaults.monospace;
    };
  in {
    fonts.fontconfig = {
      enable = true;

      defaultFonts = defaults;

      hinting = "slight";
      subpixelRendering = "rgb";
    };

    home.packages = let
      extraPackages = with pkgs; [
        corefonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        vista-fonts
        # nerd-fonts.symbols-only
      ];
    in
      defaultPackages ++ extraPackages;

    # per-program config
    programs = {
      # ghostty
      ghostty.settings = {
        font-family = defaults.monospace;
        font-size = sizes.terminal;

        alpha-blending = "linear-corrected";

        adjust-underline-thickness = "-50%";
        adjust-strikethrough-thickness = "-50%";
        adjust-overline-thickness = "-50%";
        adjust-box-thickness = "-25%";
      };

      # vscodium
      vscodium.profiles.default.userSettings = {
        "editor.fontFamily" = lib.strings.concatStrings defaults.monospace;
        "editor.fontLigatures" = true;
        "editor.fontSize" = sizes.terminal;
        "terminal.integrated.fontLigatures.enabled" = true;
        "terminal.integrated.fontSize" = sizes.terminal;
        "terminal.integrated.letterSpacing" = 1;

        # VSCodium-specific
        # "workbench.experimental.fontFamily" = defaults.monospace;
        # "workbench.experimental.fontSize" = zoomedInSize - 2;
      };

      # its disgraced brother vscode
      vscode.profiles.default.userSettings = {
        "editor.fontFamily" = lib.strings.concatStrings defaults.monospace;
        "editor.fontLigatures" = true;
        "editor.fontSize" = sizes.terminal;
        "terminal.integrated.fontLigatures.enabled" = true;
        "terminal.integrated.fontSize" = sizes.terminal;
        "terminal.integrated.letterSpacing" = 1;
      };
    };

    # qt-specific
    qt.qt5ctSettings = qtctSettings;
    qt.qt6ctSettings = qtctSettings;
  };
}
