local lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Setup completion
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
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
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Setup LSP keybindings and options
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  -- Navigation (these will be overridden by telescope keymaps for better UX)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  -- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  
  -- Documentation
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  
  -- Code actions
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
  
  -- Diagnostics
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  
  -- Workspace
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end

-- Setup capabilities for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go LSP
lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      usePlaceholders = true,
    },
  },
})

-- TypeScript/JavaScript LSP
lsp.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Additional language servers (commented out - install if needed)
--
-- Rust LSP
-- lsp.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--         command = "check"
--       }
--     }
--   }
-- })

-- Lua LSP (requires: brew install lua-language-server or similar)
lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Python LSP (requires: pip install pyright)
-- lsp.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- PHP LSP (requires: npm install -g intelephense)
lsp.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Global LSP settings
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Auto format on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Commands
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})

vim.api.nvim_create_user_command("OR", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and string.match(action.kind, "source.organizeImports")
    end,
    apply = true,
  })
end, {})
