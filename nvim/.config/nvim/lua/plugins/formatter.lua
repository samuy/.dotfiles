local util = require("formatter.util")

require('formatter').setup({
  filetype = {
    go = {
      function()
        return {
          exe = 'goimports',
          stdin = true,
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "./node_modules/prettier/bin-prettier.js",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    svelte = {
      function()
        return {
          exe = "./node_modules/prettier/bin-prettier.js",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    python = {
      function()
        return {
          exe = "black",
          args = { "-q", "-" },
          stdin = true,
        }
      end,
    },
    sh = {
      function()
        return {
          exe = "shfmt",
          args = { "-i", 2 },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          stdin = true,
        }
      end,
    },
  }
})
