return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- TODO: add options to shfmt
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.clang_format.with {
        -- FIXME: why does it set offset and length in the source args?
        extra_args = {
          "--style",
          "{ColumnLimit: 120, IndentWidth: 4, TabWidth: 4}",
        },
      },
      -- null_ls.builtins.formatting.csharpier,
      null_ls.builtins.formatting.gersemi.with {
        args = {
          "--line-length",
          "120",
          "-",
        },
      },
      -- null_ls.builtins.formatting.google_java_format,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.black.with {
        args = {
          "--line-length",
          "120",
          "--stdin-filename",
          "$FILENAME",
          "--quiet",
          "-",
        },
      },
      null_ls.builtins.formatting.rustfmt.with {
        args = {
          "--config",
          "max_width=120",
          "--emit=stdout",
        },
      },
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.cpplint.with {
        args = {
          "--linelength=120",
          "$FILENAME",
        },
      },
      null_ls.builtins.diagnostics.semgrep,
      null_ls.builtins.diagnostics.cmake_lint.with {
        args = {
          "--filter=+linelength",
          "-linelength=120",
          "$FILENAME",
        },
      },
      null_ls.builtins.diagnostics.selene,
    }

    return config -- return final config table
  end,
}
