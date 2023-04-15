-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "csharp_ls",
        "cmake",
        "jdtls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "shfmt",
        "clang-format",
        -- "csharpier",
        "gersemi",
        -- "google-java-format",
        "stylua",
        "black",
        "rustfmt",
        "shellcheck",
        "cpplint",
        "semgrep",
        "cmakelint",
        "selene",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
