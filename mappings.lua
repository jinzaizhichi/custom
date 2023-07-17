local M = {}

M.general = {
  n = {
    [";"] = {":", "enter command mode", opts = {nowait = true}},
     }
 }

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
       require('dap_python').test_method()
      end
    },
  },
}
return M
