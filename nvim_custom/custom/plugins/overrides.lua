local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "go",
    "python",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "html-lsp",
    "css-lsp",
    "typescript-language-server",
    "deno",
    "tailwindcss-language-server",
    "prettier",
    "eslint_d",

    -- cpp
    "clangd",
    "clang-format",
    -- "cpplint",

    -- python
    "python-lsp-server",
    "mypy",
    "flake8",
    "autopep8",

    -- go
    "gopls",

    -- markdown
    "marksman"

  },
}

-- cmp
M.cmp = {
  sources = {
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer"},
    { name = "nvim_lua" },
    { name = "path" },
    { name = "luasnip" , keyword_length = 2 },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false, -- show git ignored files
  },

  renderer = {
    highlight_git = false,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
