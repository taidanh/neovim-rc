require("nvim-lsp-installer").setup {}

local lsp = require "lspconfig"
local coq = require "coq"
cfg = {
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}

require "lsp_signature".setup(cfg)

--   ASCII Font is "Doom" on http://www.patorjk.com/software/taag
--   ___ 
--  / __|
-- | (__ 
--  \___|

lsp.clangd.setup{coq.lsp_ensure_capabilities()}

--              _   _                 
--             | | | |                
--  _ __  _   _| |_| |__   ___  _ __  
-- | '_ \| | | | __| '_ \ / _ \| '_ \ 
-- | |_) | |_| | |_| | | | (_) | | | |
-- | .__/ \__, |\__|_| |_|\___/|_| |_|
-- | |     __/ |                      
-- |_|    |___/

lsp.pyright.setup{coq.lsp_ensure_capabilities()}

--                 _   
--                | |  
--  _ __ _   _ ___| |_ 
-- | '__| | | / __| __|
-- | |  | |_| \__ \ |_ 
-- |_|   \__,_|___/\__|
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

require('rust-tools').setup(opts)

--  _               _        _ _ 
-- | |             | |      | | |
-- | |__   __ _ ___| | _____| | |
-- | '_ \ / _` / __| |/ / _ \ | |
-- | | | | (_| \__ \   <  __/ | |
-- |_| |_|\__,_|___/_|\_\___|_|_|

lsp.hls.setup{coq.lsp_ensure_capabilities()}

--    ___                  _____           _       _   
--   |_  |                /  ___|         (_)     | |  
--     | | __ ___   ____ _\ `--.  ___ _ __ _ _ __ | |_ 
--     | |/ _` \ \ / / _` |`--. \/ __| '__| | '_ \| __|
-- /\__/ / (_| |\ V / (_| /\__/ / (__| |  | | |_) | |_ 
-- \____/ \__,_| \_/ \__,_\____/ \___|_|  |_| .__/ \__|
--                                          | |        
--                                          |_|

-- ______  _   _ ______ 
-- | ___ \| | | || ___ \
-- | |_/ /| |_| || |_/ /
-- |  __/ |  _  ||  __/ 
-- | |    | | | || |    
-- \_|    \_| |_/\_| 

lsp.intelephense.setup{coq.lsp_ensure_capabilities()}

--  _               _     
-- | |             | |    
-- | |__   __ _ ___| |__  
-- | '_ \ / _` / __| '_ \ 
-- | |_) | (_| \__ \ | | |
-- |_.__/ \__,_|___/_| |_|

-- lsp.bashls.setup{coq.lsp_ensure_capabilities()}

--  _             
-- | |            
-- | |_   _  __ _ 
-- | | | | |/ _` |
-- | | |_| | (_| |
-- |_|\__,_|\__,_|

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

-- lsp.sumneko_lua.setup {coq.lsp_ensure_capabilities({
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- })}
