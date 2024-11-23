--                        _           
--  _ __   ___  _____   _(_)_ __ ___  
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
-- | | | |  __/ (_) \ V /| | | | | | |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_|


-- Core stuff (lua/) --
require("keybindings")          -- Keybindings and remaps
require("settings")             -- Regular settings
require("plugins")              -- Plugin management

-- ! Plugins stored in after/plugin/ are loaded automatically !

-- Optional plugins (lua/plugin/) --
require("plugin.lsp")          -- LSP stuff
-- require("plugin.nvim-tree")    -- Nvim-Tree

