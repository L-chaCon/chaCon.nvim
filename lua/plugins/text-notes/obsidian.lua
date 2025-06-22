return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  enable = false,
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/workspace/notes/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/workspace/notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>zt", "<cmd>ObsidianTemplate<cr>", desc = "Template" },
    { "<leader>zn", "<cmd>ObsidianNew<cr>", desc = "New Note" },
    { "<leader>zo", "<cmd>ObsidianToday<cr>", desc = "Today To-Do" },
    { "<leader>zl", "<cmd>ObsidianLinkNew<cr>", mode = "v", desc = "New Note Linked to this Text" },
    { "<leader>zp", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image to Note" },
    { "<leader>zf", "<cmd>ObsidianFollowLink [vsplit]<cr>", desc = "Follow Link" },
    { "<leader>zb", "<cmd>ObsidianBacklinks<cr>", desc = "Back Link" },
    { "<leader>zs", "<cmd>ObsidianTags<cr>", desc = "Search tag" },
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/workspace/notes",
      },
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily.md",
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    new_notes_location = "current_dir",
    disable_frontmatter = true,

    -- Optional, for templates (see below).
    templates = {
      folder = "template",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    ---@param url string
    follow_url_func = function(url)
      vim.ui.open(url)
    end,

    ---@param img string
    follow_img_func = function(img)
      vim.fn.jobstart({ "qlmanage", "-p", img }) -- Mac OS quick look preview
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    end,
    -- disable UI to use
    ui = {
      enable = true,
    },
  },
}
