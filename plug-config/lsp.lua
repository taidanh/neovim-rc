local lsp = require "lspconfig"
local coq = require "coq"

--   ASCII Font is "Doom" on http://www.patorjk.com/software/taag
--   ___ 
--  / __|
-- | (__ 
--  \___|

require'lspconfig'.clangd.setup{coq.lsp_ensure_capabilities()}

--              _   _                 
--             | | | |                
--  _ __  _   _| |_| |__   ___  _ __  
-- | '_ \| | | | __| '_ \ / _ \| '_ \ 
-- | |_) | |_| | |_| | | | (_) | | | |
-- | .__/ \__, |\__|_| |_|\___/|_| |_|
-- | |     __/ |                      
-- |_|    |___/

require'lspconfig'.pyright.setup{coq.lsp_ensure_capabilities()}

--                 _   
--                | |  
--  _ __ _   _ ___| |_ 
-- | '__| | | / __| __|
-- | |  | |_| \__ \ |_ 
-- |_|   \__,_|___/\__|

require'lspconfig'.rls.setup{coq.lsp_ensure_capabilities()}

--    ___                  _____           _       _   
--   |_  |                /  ___|         (_)     | |  
--     | | __ ___   ____ _\ `--.  ___ _ __ _ _ __ | |_ 
--     | |/ _` \ \ / / _` |`--. \/ __| '__| | '_ \| __|
-- /\__/ / (_| |\ V / (_| /\__/ / (__| |  | | |_) | |_ 
-- \____/ \__,_| \_/ \__,_\____/ \___|_|  |_| .__/ \__|
--                                          | |        
--                                          |_|



--  _               _     
-- | |             | |    
-- | |__   __ _ ___| |__  
-- | '_ \ / _` / __| '_ \ 
-- | |_) | (_| \__ \ | | |
-- |_.__/ \__,_|___/_| |_|

require'lspconfig'.bashls.setup{coq.lsp_ensure_capabilities()}

--  _             
-- | |            
-- | |_   _  __ _ 
-- | | | | |/ _` |
-- | | |_| | (_| |
-- |_|\__,_|\__,_|

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
