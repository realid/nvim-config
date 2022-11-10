require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ['pylsp'] = function()
        require 'lspconfig'.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {'E127', 'E303', 'E501'},
                            maxLineLength = 100
                        },
                    },
                },
            },
        }
    end,
    ["sumneko_lua"] = function ()
        require("lspconfig").sumneko_lua.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = '/usr/local/bin',
                    },
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable =false
                    },
                },
            },
        }
    end,
})


