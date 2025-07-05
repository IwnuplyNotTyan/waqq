return {
  {
    "nomnivore/ollama.nvim",
    opts = {
      serve = {
        on_start = true,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
      },
    },
  },
}
