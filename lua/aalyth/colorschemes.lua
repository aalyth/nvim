
function __lualine__(theme)
    require("lualine").setup {
        options = {
            theme = theme,
            icons_enabled = false,
            component_separators = { left = '|', right = '<'},
            section_separators = { left = '', right = ''},
        },
    }
end

function everforest()
    -- vim.g.everforest_background = 'soft'
    vim.g.everforest_better_performance = 1
    vim.cmd("colorscheme everforest")
    vim.g.airline_theme = "everforest"
end

function neon() 
    vim.g.neon_style = "dark"
    vim.cmd("colorscheme neon")
    vim.cmd("highlight Identifier guifg='#a5ebf7'")
    -- vim.cmd("highlight Normal guibg='#020614'")
    vim.cmd("highlight Normal guibg='#000000'")
    __lualine__("neon")
end

function terafox()
    vim.cmd("colorscheme terafox")
    __lualine__("terafox")
end

function nord()
    vim.cmd("colorscheme nord")
    vim.cmd("colorscheme nordic")
    vim.g.airline_theme = "nord"
end

function no_clown_fiesta() 
    vim.cmd("colorscheme no-clown-fiesta")
    require("lualine").setup {
        options = {
            icons_enabled = false,
        },
    }
end

