{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    
    settings.vim = {


      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
        sql.enable = true;
        clang.enable = true;
        ts.enable = true;
        python.enable = true;
        bash.enable = true;
        css.enable = true;
        typst.enable = true;
        yaml.enable = true;
        java = {
          lsp = {
            enable = true;
            package = ["jdt-language-server" "-data" "~/.cache/jdtls/workspace"];
          };
        };
      };
    };
  };
}