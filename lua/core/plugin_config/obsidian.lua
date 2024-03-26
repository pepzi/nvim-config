local obsidian = require("obsidian")

obsidian.setup({
  workspaces = {
    {
      name = "personal",
      path = "/home/robert/obsidian-vault",
    },
  },
  daily_notes = {
    folder = "Personal/Daily",
  },
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    if title ~= nil then
      return title
    else
      local suffix = ""
      for _ = 1, 8 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
      return "Unnamed-" .. suffix
    end
  end,
    new_notes_location = "current_dir",

})
