require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)


vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- local lsp = require('lsp-zero').preset({
--   name = 'minimal',
--   set_lsp_keymaps = true,
--   manage_nvim_cmp = true,
--   suggest_lsp_servers = false,
-- })
-- lsp.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--
--   -- if client.name == "eslint" then
--   --   vim.cmd.LspStop('eslint')
--   --   return
--   -- end
--
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   --vim.keymap.set("n", "<leader>fs", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- lsp.setup_nvim_cmp({
--   mapping = cmp.mapping.preset.insert({
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   }),
-- })
--
-- local cmp = require('cmp')
--
-- cmp.setup({
--   sources = {
--     {name = 'nvim_lsp'},
--   },
--   snippet = {
--     expand = function(args)
--       vim.snippet.expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   }),
-- })
--
-- lsp.setup()
