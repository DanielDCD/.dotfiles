local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end
local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
  return
end
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },
  formatting = {
    format = require('lspkind').cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = '[LSP]',
        buffer = '[Buffer]',
        nvim_lua = '[Lua]',
        ultisnips = '[UltiSnips]',
        vsnip = '[vSnip]',
        treesitter = '[treesitter]',
        look = '[Look]',
        path = '[Path]',
        spell = '[Spell]',
        calc = '[Calc]',
        emoji = '[Emoji]',
        neorg = '[Neorg]',
        cmp_tabnine = '[TabNine]',
      },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end, { 'i', 's', 'c' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.jump_backwards(fallback)
    end, { 'i', 's', 'c' }),
  }),
  sources = cmp.config.sources(
    { { name = 'nvim_lsp' }, { name = 'ultisnips' } },
    { { name = 'buffer' } }
  ),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, { { name = 'buffer' } }),
})

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
})
