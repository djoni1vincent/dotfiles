return {
  -- Парсер для Django-шаблонов
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html" })
    end,
  },

  -- .html файлы внутри templates/ открываются как htmldjango
  {
    "LazyVim/LazyVim",
    opts = {},
    init = function()
      vim.filetype.add({
        pattern = {
          [".*templates/.*%.html"] = "htmldjango",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Django Language Server: дополняет basedpyright Django-специфичными фичами
        -- Работает только в проектах с manage.py в корне
        djls = {
          cmd = { "djls", "serve" },
          filetypes = { "python" },
          root_markers = { "manage.py" },
        },

        -- Django Template LSP: автодополнение тегов и переменных в .html-шаблонах
        djlsp = {
          cmd = { "djlsp" },
          filetypes = { "htmldjango" },
          root_markers = { "manage.py", ".git" },
        },
      },
    },
  },
}
