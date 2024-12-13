return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { title = "Recent Files",   padding = 1 },
        { section = "recent_files", limit = 5,  padding = 1 },
        { title = "Sessions",       padding = 1 },
        { section = "projects",     limit = 5,  gap = 1,    padding = 1 },

        { section = "startup",       },

      }
    }
  }
}
