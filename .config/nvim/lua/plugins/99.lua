return {
  {
    "ThePrimeagen/99",
    -- lazy-load on keypress
    keys = {
      {
        "<leader>9s",
        function()
          require("99").search()
        end,
        desc = "99: Search",
      },
      {
        "<leader>9v",
        mode = "v",
        function()
          require("99").visual()
        end,
        desc = "99: Visual rewrite",
      },
      {
        "<leader>9o",
        function()
          require("99").open()
        end,
        desc = "99: Open last result",
      },
      {
        "<leader>9x",
        function()
          require("99").stop_all_requests()
        end,
        desc = "99: Stop requests",
      },
      {
        "<leader>9l",
        function()
          require("99").view_logs()
        end,
        desc = "99: View logs",
      },
    },
    config = function()
      require("99").setup({
        tmp_dir = "./tmp",
        md_files = { "AGENT.md" },
        model = "openai/gpt-5-codex",
        -- provider defaults to OpenCodeProvider (uses `opencode`)
      })
    end,
  },
}
