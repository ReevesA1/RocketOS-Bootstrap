{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
  ripgrep
  nodejs
  yarn
  ];



  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      extraLuaConfig = ''
        vim.opt.backup = false
        vim.opt.writebackup = false
        vim.opt.swapfile = false
        vim.opt.cmdheight = 2
        vim.opt.updatetime = 300

        vim.opt.termguicolors = true

        vim.opt.number = true
        vim.opt.showmode = false
        vim.opt.mouse = ""

        vim.cmd('autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab')

        -- nvim-cmp / nvim-lspconfig setup
        -- Add additional capabilities supported by nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require('lspconfig')

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = { 'rust_analyzer', 'pyright' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            -- on_attach = my_custom_on_attach,
            capabilities = capabilities,
          }
        end
        lspconfig["tsserver"].setup({
          on_attach = function (client, buffer)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, buffer)
          end,
          capabilities = capabilitiesWithoutFormatting,
          cmd = { 
            "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", 
            "--stdio", 
            "--tsserver-path", 
            "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib/" 
          }
        })

        -- luasnip setup
        local luasnip = require 'luasnip'

        -- nvim-cmp setup
        local cmp = require 'cmp'
        cmp.setup {
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
            ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
            -- C-b (back) C-f (forward) for snippet placeholder navigation.
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          }),
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          },
        }
      '';
      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-solarized-lua;
          type = "lua";
          config = ''
            vim.cmd('colorscheme solarized-high')
          '';
        }
        nvim-lspconfig      # Configurations for LSP servers
        nvim-cmp            # Autocomplete
        cmp-nvim-lsp        # LSP source for nvim-cmp
        cmp_luasnip         # Snippets source for nvim-cmp
        luasnip             # Snippets plugin
        {
          plugin = telescope-nvim;
          type = "lua";
          config = ''
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
          '';
        }
        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = "require('gitsigns').setup()";
        }
        {
          plugin = feline-nvim;
          type = "lua";
          config = "require('feline').setup()";
        }
        nvim-web-devicons   # Icons
        (nvim-treesitter.withPlugins (
          # https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/development/tools/parsing/tree-sitter/grammars
          plugins:
            with plugins; [
              tree-sitter-lua
              tree-sitter-vim
              tree-sitter-html
              tree-sitter-yaml
              tree-sitter-comment
              tree-sitter-bash
              tree-sitter-javascript
              tree-sitter-nix
              tree-sitter-typescript
            ]
        ))

        # Language support
        vim-nix     # Nix
        vim-toml    # TOML
        vim-json    # JSON
      ];
      extraPackages = with pkgs; [
        rnix-lsp
        rust-analyzer
        pyright
        fd
        nodePackages.typescript
        nodePackages.typescript-language-server
        nodePackages.yaml-language-server
      ];
    };
    fzf = {
      enable = true;
    };
  };
}