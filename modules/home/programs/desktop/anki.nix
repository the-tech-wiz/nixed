{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    programs.anki = {
      enable = true;
      # TODO: enable some addon downloader
      # addons = [
      #   (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
      #     pname = "google-image-batch-downloader-for-anki";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "vpnry";
      #       repo = "${finalAttrs.pname}";
      #       rev = "3f9800aa3f11dcf41065b78da36ccf46a57530fc";
      #       sparseCheckout = ["/"];
      #       hash = "";
      #     };
      #     sourceRoot = "${finalAttrs.src.pname}/";
      #   }))
      # ];
    };
  };
}
