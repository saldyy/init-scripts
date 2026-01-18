local builtin = require("telescope.builtin")
local telescope = require("telescope")

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.fn.getcwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      local r = vim.tbl_flatten {
        args,
        { "--column", "--color=never", "--no-heading", "--line-number", "--with-filename", "--smart-case", }
      }
      return r
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
    prompt_title = "Live MultiGrep",
  }):find()
end

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    selection_strategy = "follow",
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        width = 0.8,
        height = 0.9,
        prompt_position = "bottom",
        preview_cutoff = 5,
      },
    },
  },
  extensions = {
    fzf = {}
  }
}

pcall(telescope.load_extension, "fzf")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", live_multigrep, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
