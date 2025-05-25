local M = {}

function M.setup()
  if not vim.g.neovide then return end

  -- Fonte base
  local font_name = "FiraCode Nerd Font"
  local default_size = 14
  local font_size = default_size

  local function set_font() vim.o.guifont = string.format("%s:h%d", font_name, font_size) end

  -- Inicializa fonte
  set_font()

  -- Atalhos de zoom
  local opts = { noremap = true, silent = true, desc = "Zoom da fonte" }

  vim.keymap.set("n", "<C-=>", function()
    font_size = font_size + 1
    set_font()
  end, vim.tbl_extend("force", opts, { desc = "Aumentar fonte" }))

  vim.keymap.set("n", "<C-->", function()
    font_size = font_size - 1
    set_font()
  end, vim.tbl_extend("force", opts, { desc = "Diminuir fonte" }))

  vim.keymap.set("n", "<C-0>", function()
    font_size = default_size
    set_font()
  end, vim.tbl_extend("force", opts, { desc = "Resetar fonte" }))

  -- Outras configs do Neovide (opcional)
  vim.g.neovide_transparency = 1.0
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_cursor_trail_size = 0.3
end

return M
