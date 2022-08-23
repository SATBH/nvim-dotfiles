local packer = require("packer")
local packages = require("packages")

packer.startup(function (fun) 
	for _, package in ipairs(packages) do
		fun(package) 
	end
end)

vim.cmd("let g:instant_username = \"SATBH\"")
require("hotpot")
require("init")(vim)
