{
  flake.modules.homeManager.techwiz = {config, ...}:
  # automatic development environments.
  {
    programs.mpv = {
      enable = true;
      config = {
        ytdl-format = "bestvideo[height<=?2160]+bestaudio/best";
        embeddedfonts = "no";
        sub-scale = "0.6";
        target-colorspace-hint = "auto";
      };
    };
  };
}
