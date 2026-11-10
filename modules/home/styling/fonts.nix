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
    defaultFonts = {
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
      general = defaultFonts.sans-serif;
      fixed = defaultFonts.monospace;
    };
  in {
    fonts.fontconfig = {
      enable = true;

      inherit defaultFonts;

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
    programs = let
      inherit (sizes) desktop terminal;
      inherit (defaultFonts) sansSerif monospace;
      vscodeArgs = {
        "editor.fontFamily" =
          lib.concatMapStringsSep ", " (name: ''"${name}"'')
          monospace;
        "editor.fontLigatures" = true;
        "editor.fontSize" = terminal + 4;
        "terminal.integrated.fontLigatures.enabled" = true;
        "terminal.integrated.fontSize" = terminal + 4;
        "terminal.integrated.letterSpacing" = 1;

        # VSCodium-specific
        "workbench.experimental.fontFamily" =
          lib.concatMapStringsSep ", " (name: ''"${name}"'')
          sansSerif;
        "workbench.experimental.fontSize" = desktop + 4;
      };
    in {
      # ghostty
      ghostty.settings = {
        font-family = monospace;
        font-size = terminal;

        alpha-blending = "linear-corrected";

        adjust-underline-thickness = "-50%";
        adjust-strikethrough-thickness = "-50%";
        adjust-overline-thickness = "-50%";
        adjust-box-thickness = "-25%";
      };

      # vscodium
      vscodium.profiles.default.userSettings = vscodeArgs; # its disgraced brother vscode
      vscode.profiles.default.userSettings = vscodeArgs;
    };

    # qt-specific
    qt.qt5ctSettings = qtctSettings;
    qt.qt6ctSettings = qtctSettings;
  };
}
