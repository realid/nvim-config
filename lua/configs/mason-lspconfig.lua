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
    ["pylsp"] = function ()
        require("lspconfig").pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            enabled = false
                        },
                    },
                },
            },
        }
    end,
})


