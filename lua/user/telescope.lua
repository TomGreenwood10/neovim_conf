require('telescope').setup{
  defaults = {
    layout_strategy = 'center',
    layout_config = {
      anchor = "N",
      height = 0.3,
      mirror = true,
      prompt_position = "top",
      width = 0.7,
    },
    mappings = {
      i = {
	["<C-b>"] = "select_vertical"
      }
    },
  },
}
