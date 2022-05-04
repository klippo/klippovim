local present, packer = pcall(require, "packer")

if not present then
   local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

   print "Cloning packer.."
   vim.fn.delete(install_path, "rf")
   vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "20",
      install_path,
   }

   present, packer = pcall(require, "packer")

   if present then
      print "Packer cloned successfully."
   else
      error("Couldn't clone packer !\nPacker path: " .. install_path .. "\n" .. packer)
   end
end

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 6000, -- seconds
   },
   auto_clean = true,
   compile_on_sync = true,
}

return packer
