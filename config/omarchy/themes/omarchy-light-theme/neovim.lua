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
                bg = "#fafafa",
                bg_dark = "#fafafa",
                bg_highlight = "#e5e5e6",

                -- Foreground colors
                -- fg: Object properties, builtin types, builtin variables, member access, default text
                fg = "#090a0b",
                -- fg_dark: Inactive elements, statusline, secondary text
                fg_dark = "#383a42",
                -- comment: Line highlight, gutter elements, disabled states
                comment = "#e5e5e6",

                -- Accent colors
                -- red: Errors, diagnostics, tags, deletions, breakpoints
                red = "#e45649",
                -- orange: Constants, numbers, current line number, git modifications
                orange = "#e45649",
                -- yellow: Types, classes, constructors, warnings, numbers, booleans
                yellow = "#c18401",
                -- green: Comments, strings, success states, git additions
                green = "#50a14f",
                -- cyan: Parameters, regex, preprocessor, hints, properties
                cyan = "#0184bc",
                -- blue: Functions, keywords, directories, links, info diagnostics
                blue = "#4078f2",
                -- purple: Storage keywords, special keywords, identifiers, namespaces
                purple = "#a626a4",
                -- magenta: Function declarations, exception handling, tags
                magenta = "#a626a4",
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
