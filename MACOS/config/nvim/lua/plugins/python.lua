vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

return {
  { import = "lazyvim.plugins.extras.lang.python" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- inlay hints отключены — при обучении они больше мешают, чем помогают
                inlayHints = {
                  variableTypes = false,
                  functionReturnTypes = false,
                  parameterTypes = false,
                  callArgumentNames = false,
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      settings = {
        search = {
          -- ищет .venv/bin/python в домашней директории (покрывает uv-проекты)
          uv_venv = {
            command = "fd -H -I -t f python $HOME/dev --full-path --color never",
          },
        },
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
  },
}
