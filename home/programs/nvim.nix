{ config, pkgs, ... }:

let
  # Deine benutzerdefinierte Tastenbelegung als Lua-String
  customKeymaps = ''
    -- ==========================================
    -- DEINE CUSTOM KEYMAPS (NeoVim-Standard überschrieben)
    -- ==========================================
    
    vim.g.mapleader = " "
    
    -- Basis-Settings
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    
    -- NeoVim verwendet Lua für Keymaps: vim.keymap.set(mode, lhs, rhs, opts)
    
    -- Navigation (Colemak/Custom Layout)
    vim.keymap.set({'n', 'v', 'o'}, 'j', 'h', { noremap = true })
    vim.keymap.set({'n', 'v', 'o'}, 'ö', 'l', { noremap = true })
    vim.keymap.set({'n', 'v', 'o'}, 'k', 'j', { noremap = true })
    vim.keymap.set({'n', 'v', 'o'}, 'l', 'k', { noremap = true })
    
    -- Modus-Wechsel
    vim.keymap.set('i', 'nn', '<Esc>', { noremap = true })
    vim.keymap.set('n', 'ii', 'i', { noremap = true })
    vim.keymap.set('n', 'm', 'v', { noremap = true })
    
    -- Clipboard-Operationen
    vim.keymap.set({'n', 'v'}, 'c', 'y', { noremap = true })      -- Yank
    vim.keymap.set({'n', 'v'}, 'x', 'd', { noremap = true })      -- Delete
    vim.keymap.set({'n', 'v'}, 'v', 'p', { noremap = true })      -- Paste
    vim.keymap.set({'n', 'v'}, 'V', 'P', { noremap = true })      -- Paste before
    
    -- Undo/Redo
    vim.keymap.set('n', '<C-z>', 'u', { noremap = true })
    vim.keymap.set('i', '<C-z>', '<C-o>u', { noremap = true })
    vim.keymap.set('n', '<C-y>', '<C-r>', { noremap = true })
    vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { noremap = true })
    
    -- ==========================================
    -- ALLE ANDEREN TASTEN DEAKTIVIEREN
    -- ==========================================
    
    local keys_to_disable = {
      n = { 'h', ';', ',', 'w', 'b', 'e', '$', '0', '^', 'G', 'gg', 's',
            '/', '?', 'n', 'N', '*', '#', 'y', 'd', 'p', 'P', 'a', 'A', 
            'i', 'I', 'o', 'O', 'V', 'u', '<C-r>', 'r', 'R', '<C-d>', 
            '<C-u>', '<C-f>', '<C-b>', '<C-o>', '<C-i>', '<F1>', '<F2>',
            '<F3>', '<F4>', '<F5>', '<F6>', '<F7>', '<F8>', '<F9>', 
            '<F10>', '<F11>', '<F12>' },
      v = { 'y', 'd', 'p', 'P', '<', '>' },
      i = { '<C-c>', '<C-[>', '<Up>', '<Down>', '<Left>', '<Right>', 
            '<Home>', '<End>' },
      o = { 'aw', 'iw', 'a"', 'i"', "a'", "i'" },
      c = { '<C-a>', '<C-e>', '<C-f>', '<C-b>' }
    }
    
    for mode, keys in pairs(keys_to_disable) do
      for _, key in ipairs(keys) do
        vim.keymap.set(mode, key, '<Nop>', { noremap = true })
      end
    end
  '';

in
{
  # ==========================================
  # NEOVIM KONFIGURATION
  # ==========================================
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Wichtig: Wir nutzen extraLuaConfig statt extraConfig (Vimscript)
    extraLuaConfig = ''
      ${customKeymaps}
      
      -- ==========================================
      -- PLUGIN SETUP (ohne lazy.nvim, direkt via Nix)
      -- ==========================================
      
      -- LSP Configuration
      local lspconfig = vim.lsp.config
      local cmp = require('cmp')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Autocomplete Setup
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
      
      -- JAVA LSP (jdtls)
      lspconfig.jdtls.setup({
        cmd = { 'jdt-language-server' },
        root_dir = lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git', '.classpath'),
        capabilities = capabilities,
        settings = {
          java = {
            configuration = {
              runtimes = {
                { name = "JavaSE-17", path = "${pkgs.jdk17}/lib/openjdk" },
                { name = "JavaSE-21", path = "${pkgs.jdk21}/lib/openjdk" },
              }
            }
          }
        }
      })
      
      -- C/C++ LSP (clangd)
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { 'clangd', '--background-index', '--clang-tidy', '--header-insertion=iwyu' },
      })
      
      -- Treesitter
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
      
      -- Telescope
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
          },
        },
      })
      
      -- Neo-tree
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
        },
      })
      
      -- Lualine
      require('lualine').setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
        },
      })
      
      -- Bufferline
      require('bufferline').setup({
        options = {
          mode = 'buffers',
          separator_style = 'slant',
        },
      })
      
      -- Gitsigns
      require('gitsigns').setup()
      
      -- ==========================================
      -- LSP KEYMAPS (Leader-basiert)
      -- ==========================================
      
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'References' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find Buffers' })
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Explorer' })
    '';

    plugins = with pkgs.vimPlugins; [
      # LSP & Completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      
      # Syntax (WICHTIG: nur einer der beiden!)
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-java
        p.tree-sitter-c
        p.tree-sitter-cpp
        p.tree-sitter-lua
        p.tree-sitter-nix
        p.tree-sitter-markdown
      ]))
      
      # UI
      telescope-nvim
      neo-tree-nvim
      lualine-nvim
      bufferline-nvim
      gitsigns-nvim
      nvim-web-devicons  # Benötigt für neo-tree/icons
      
      # Optional: Theme
      gruvbox-nvim
    ];
  };

  # ==========================================
  # SYSTEM-Pakete für Java/C Entwicklung
  # ==========================================
  home.packages = with pkgs; [
    # LSP Server (werden von Neovim genutzt)
    jdt-language-server
    nil  # Nix LSP (optional)
    
    # Telescope Dependencies (ESSENZIELL)
    ripgrep
    fd
    
    # Formatter (optional)
    #google-java-format
    #clang-format<
  ];
}