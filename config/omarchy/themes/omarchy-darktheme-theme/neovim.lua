return {
    {
        "bjarneo/aether.nvim",
        branch = "v2",
        name = "aether",
        priority = 1000,
        opts = {
            transparent = false,
            colors = {
                -- Background colors
                bg = "#1d2021",
                bg_dark = "#1d2021",
                bg_highlight = "#32302f",

                -- Foreground colors
                -- fg: Object properties, builtin types, builtin variables, member access, default text
                fg = "#ddc7a1",
                -- fg_dark: Inactive elements, statusline, secondary text
                fg_dark = "#d4be98",
                -- comment: Line highlight, gutter elements, disabled states
                comment = "#32302f",

                -- Accent colors
                -- red: Errors, diagnostics, tags, deletions, breakpoints
                red = "#ea6962",
                -- orange: Constants, numbers, current line number, git modifications
                orange = "#ea6962",
                -- yellow: Types, classes, constructors, warnings, numbers, booleans
                yellow = "#d8a657",
                -- green: Comments, strings, success states, git additions
                green = "#a9b665",
                -- cyan: Parameters, regex, preprocessor, hints, properties
                cyan = "#89b482",
                -- blue: Functions, keywords, directories, links, info diagnostics
                blue = "#7daea3",
                -- purple: Storage keywords, special keywords, identifiers, namespaces
                purple = "#d3869b",
                -- magenta: Function declarations, exception handling, tags
                magenta = "#d3869b",
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
