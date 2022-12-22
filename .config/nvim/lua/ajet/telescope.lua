require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                ["<C-j>"] = "which_key",
                ["<C-k>"] = "which_key",
            }
        }
    }
}
