local present, bufferline = pcall(require, "bufferline")

if present then
  bufferline.setup{
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "",
          highlight = "Directory",
          text_align = "left"
        }
      },
      groups = {
        options = {
          toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        },
      }
    }
  }
end
