{
  inputs,
  lib,
  ...
}: {
  flake.modules.homeManager.programs = {pkgs, ...}: {
    imports = [inputs.lazyvim.homeManagerModules.default];
    programs.lazyvim = {
      enable = true;
      configFiles = ./.;
      config = {
        keymaps = ''
          local map = vim.keymap.set
          -- move lines
          map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
          map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
          map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
          map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
          map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
          map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
          -- quick find keymaps
          map("n", "<C-p>", ":Telescope keymaps")
        '';
      };
      ignoreBuildNotifications = true;
      extras = {
        # TODO: add LSP: arduino, esp32, (potentially) basedpyright fix, rust clippy
        lang =
          lib.genAttrs
          [
            # tooling
            "nix"
            "git"
            "docker"

            # markup
            # NOTE: typst preview fixed soon
            "typst"
            "json"
            "markdown"
            "toml"
            "yaml"

            # programming
            "clangd"
            "rust"
            "scala"
            "haskell"
            "python"
            "dotnet"
          ]
          (_: {
            enable = true;
            installDependencies = true;
          });
      };
      extraPackages = with pkgs; [
        # Nix
        nixd # LSP
        alejandra # formatter

        # Lua
        stylua
      ];
    };
  };
}
