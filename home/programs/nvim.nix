{ config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.prolog

            # LSP Support
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      cmp_luasnip
    ];

    extraConfig = ''
      set number
      set relativenumber

      nnoremap j h
      vnoremap j h
      onoremap j h

      nnoremap ö l
      vnoremap ö e  
      onoremap ö l

      nnoremap k j
      vnoremap k j
      onoremap k j

      nnoremap l k
      vnoremap l k
      onoremap l k

      inoremap nn <Esc>
      nnoremap ii i
      
    '';
  };
}