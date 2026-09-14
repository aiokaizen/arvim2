-- Neovim 0.12 + nvim-treesitter (master) markdown injection crash workaround.
--
-- nvim-treesitter's queries/markdown/injections.scm uses the custom directive
-- `#set-lang-from-info-string!`, which Neovim 0.12's core injection parser
-- mishandles: it produces a nil node and crashes with
--   "attempt to call method 'range' (a nil value)"
-- (vim/treesitter.lua get_range) whenever a markdown buffer is highlighted.
--
-- Neovim ships its own, compatible markdown injection queries. Override the
-- nvim-treesitter versions in-memory with the bundled ones. query.set() takes
-- precedence over query files, so this survives plugin updates.

local rt = vim.env.VIMRUNTIME
if not rt or rt == "" then
  return
end

local function use_core_query(lang, name)
  local path = string.format("%s/queries/%s/%s.scm", rt, lang, name)
  local f = io.open(path, "r")
  if not f then
    return
  end
  local text = f:read("*a")
  f:close()
  pcall(vim.treesitter.query.set, lang, name, text)
end

use_core_query("markdown", "injections")
use_core_query("markdown_inline", "injections")
