{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # banacorn.agda-mode
          fill-labs.dependi
          jnoortheen.nix-ide
          leanprover.lean4
          llvm-vs-code-extensions.vscode-clangd
          mkhl.direnv
          myriad-dreamin.tinymist
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          usernamehw.errorlens
          vadimcn.vscode-lldb
          # vscodevim.vim
          asvetliakov.vscode-neovim
        ];

        userSettings = {
          # TODO: font stuff to change
          "editor.fontFamily" = "IosevkaTerm NF";

          "editor.codeLens" = false;
          "editor.cursorBlinking" = "solid";
          "editor.formatOnSave" = true;
          "editor.inlayHints.enabled" = "offUnlessPressed";
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "editor.unicodeHighlight.ambiguousCharacters" = false;

          "editor.zoomLevel" = 2;

          "files.simpleDialog.enable" = true;
          "files.trimTrailingWhitespace" = true;

          "agdaMode.buffer.fontSize" = null;
          "agdaMode.connection.downloadPolicy" = "No, and don't ask again";
          "agdaMode.inputMethod.enabled" = false;

          "errorLens.replace" = [
            {
              # only keep the first line of diagnostics.
              matcher = "(.+)\\n";
              message = "$1";
            }
          ];

          # "lean4.input.languages" = [
          #   "lean"
          #   "lean4"
          #   "agda"
          # ];

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings" = {
            nixd.formatting.command = ["alejandra"];
          };
          "extensions.experimental.affinity" = {
            "asvetliakov.vscode-neovim" = 1;
          };
          #
          # "vim.normalModeKeyBindingsNonRecursive" = [
          #   # move between diagnostics.
          #   {
          #     before = ["[" "d"];
          #     commands = ["editor.action.marker.prevInFiles"];
          #     silent = true;
          #   }
          #   {
          #     before = ["]" "d"];
          #     commands = ["editor.action.marker.nextInFiles"];
          #     silent = true;
          #   }
          #
          #   # show LSP hover.
          #   {
          #     before = ["K"];
          #     commands = ["editor.action.showHover"];
          #     silent = true;
          #   }
          # ];
          # "vim.visualModeKeyBindings" = [
          #   # indent and outdent lines.
          #   {
          #     before = [">"];
          #     commands = ["editor.action.indentLines"];
          #   }
          #   {
          #     before = ["<"];
          #     commands = ["editor.action.outdentLines"];
          #   }
          # ];
          # "vim.useSystemClipboard" = true;
        };
      };
    };
  };
}
