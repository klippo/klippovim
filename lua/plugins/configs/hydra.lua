local Hydra = require('hydra')
local gitsigns = require('gitsigns')

local hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]]

Hydra({
  hint = hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      position = 'bottom',
      border = 'rounded'
    },
    on_enter = function()
      vim.bo.modifiable = false
      gitsigns.toggle_signs(true)
      gitsigns.toggle_linehl(true)
    end,
    on_exit = function()
      gitsigns.toggle_signs(false)
      gitsigns.toggle_linehl(false)
      gitsigns.toggle_deleted(false)
      vim.cmd 'echo' -- clear the echo area
    end
  },
  mode = { 'n', 'x' },
  body = '<C-G>',
  heads = {
    { 'J', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gitsigns.next_hunk() end)
      return '<Ignore>'
    end, { expr = true } },
    { 'K', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gitsigns.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true } },
    { 's', ':Gitsigns stage_hunk<CR><CR>', { silent = true } },
    { 'u', gitsigns.undo_stage_hunk },
    { 'S', gitsigns.stage_buffer },
    { 'p', gitsigns.preview_hunk },
    { 'd', gitsigns.toggle_deleted, { nowait = true } },
    { 'b', gitsigns.blame_line },
    { 'B', function() gitsigns.blame_line { full = true } end },
    { '/', gitsigns.show, { exit = true } }, -- show the base of the file
    { '<Enter>', '<cmd>Neogit<CR><CR>', { exit = true } },
    { 'q', nil, { exit = true, nowait = true } },
  }
})



Hydra({
  hint = [[
 ^^^^^^     Move     ^^^^^^   ^^     Split      ^^^^    Size
 ^^^^^^--------------^^^^^^   ^^---------------    ^^^^------------- 
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    _s_: horizontally    _+_ _-_: height
 _h_ ^ ^ _l_   _H_ ^ ^ _L_    _v_: vertically      _>_ _<_: width
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _q_: close           ^ _=_ ^: equalize
 focus^^^^^^   window^^^^^^
 ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^    _b_: choose buffer   ^ ^ ^ ^    _<Esc>_
]] ,
  config = {
    hint = {
      border = 'rounded',
      width = 1000

    }
  },
  mode = 'n',
  body = '<C-w>',
  heads = {
    -- Move focus
    { 'h', '<C-w>h' },
    { 'j', '<C-w>j' },
    { 'k', '<C-w>k' },
    { 'l', '<C-w>l' },
    -- Move window
    { 'H', '<Cmd>WinShift left<CR>' },
    { 'J', '<Cmd>WinShift down<CR>' },
    { 'K', '<Cmd>WinShift up<CR>' },
    { 'L', '<Cmd>WinShift right<CR>' },
    -- Split
    { 's', '<C-w>s' },
    { 'v', '<C-w>v' },
    { 'q', '<Cmd>try | close | catch | endtry<CR><CR>', { desc = 'close window' } },
    -- Size
    { '+', '<C-w>+' },
    { '-', '<C-w>-' },
    { '>', '2<C-w>><CR>', { desc = 'increase width' } },
    { '<', '2<C-w><<CR>', { desc = 'decrease width' } },
    { '=', '<C-w>=<CR>', { desc = 'equalize' } },
    --
    { 'b', '<Cmd>BufExplorer<CR><CR>', { exit = true, desc = 'choose buffer' } },
    { '<Esc>', nil, { exit = true } }
  }
})

Hydra({
  hint = [[
 _f_: files       _m_: marks            _h_: vim help   _c_: execute command
 _o_: old files   _g_: live grep        _k_: keymap     _;_: commands history
 _p_: projects    _/_: search in file   _r_: registers  _?_: search history
 ^
 ^ ^              ^ ^        _<Enter>_: Telescope       ^ ^            _<Esc>_
 ]],
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      position = 'bottom',
      border = 'rounded'
    },
  },
  mode = 'n',
  body = '<C-F>',
  heads = {
    { 'f', '<Cmd>Telescope find_files<CR>', { exit = true } },
    { 'g', '<Cmd>Telescope live_grep<CR>', { exit = true } },
    { 'h', '<Cmd>Telescope help_tags<CR>', { exit = true, desc = 'Vim help' } },
    { 'o', '<Cmd>Telescope oldfiles<CR>', { exit = true, desc = 'Recently opened files' } },
    { 'm', '<Cmd>MarksListBuf<CR>', { exit = true, desc = 'Marks' } },
    { 'k', '<Cmd>Telescope keymaps<CR>', { exit = true } },
    { 'r', '<Cmd>Telescope registers<CR>', { exit = true } },
    { 'p', '<Cmd>Telescope projects<CR>', { exit = true, desc = 'Projects' } },
    { '/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', { exit = true, desc = 'Search in file' } },
    { '?', '<Cmd>Telescope search_history<CR>', { exit = true, desc = 'Search history' } },
    { ';', '<Cmd>Telescope command_history<CR>', { exit = true, desc = 'Command-line history' } },
    { 'c', '<Cmd>Telescope commands<CR>', { exit = true, desc = 'Execute command' } },
    { '<Enter>', '<Cmd>Telescope<CR>', { exit = true, desc = 'List all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },

  }
})
