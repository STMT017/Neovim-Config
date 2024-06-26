-- vscode format
require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
-- require("luasnip.loaders.from_vscode").load_standalone { path = "~/.config/nvim/snippets/vscode/c.code-snippets" }
-- require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/snippets/vscode/" }

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
require("luasnip.loaders.from_snipmate").load { paths = "~/.config/nvim/snippets/snipmate" }

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/snippets/lua" }

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
