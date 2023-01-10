local lspconfig = require("lspconfig")

-- Options
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
	local opts = {
	    focusable = false,
	    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
	    border = 'rounded',
	    source = 'always',
	    prefix = ' ',
	    scope = 'cursor',
	}
	vim.diagnostic.open_float(nil, opts)
    end
})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

-- Setup language servers
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {

    function (server_name) -- Default handler
	lspconfig[server_name].setup {}
    end,

    ["sumneko_lua"] = function ()
	lspconfig.sumneko_lua.setup {
	    settings = {
		Lua = {
		    diagnostics = {
			globals = { "vim" }
		    },
		    workspace = {
		        library = {
			    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
			    [vim.fn.stdpath("config") .. "/lua"] = true,
			}
		    }
		}
	    }
	}
    end,
}

-- Mappings
local opts = { noremap=true, silent=true }
map = vim.api.nvim_set_keymap
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- auto-format
vim.cmd('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')

