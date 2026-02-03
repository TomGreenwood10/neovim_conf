require('CopilotChat').setup{
  -- branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  build = "make tiktoken",
  opts = {
    -- See Configuration section for rest
  },
  window = {
      layout = "float",
      width = 0.4,
      height = 0.85,
      border = "rounded",
      row = 2,
      col = 200,
      blend = 5
  },
  prompts = {
      Docstring = {
	  prompt = "Rewrite from scratch or create a python docstring for the current function. Use Google style convention with a max line length of 80 characters. Ensure the initial description follows on the same line as the oppening speech marks. Look for any required or optional attributes of the arguments and inticate this inthe Args section. Don't inculde data types.",
	  mapping = "<leader>ds",
	  description = "Creates a python docstring"
      }
  }
}
