return {
  "nvimtools/hydra.nvim",
  dependencies = "lewis6991/gitsigns.nvim",
  lazy = true,
  keys = {
    { "<leader>g", desc = "Git Hydra" },
  },
  config = function()
    local Hydra = require('hydra')
    local gitsigns = require('gitsigns')
    
    local git_hydra = Hydra({
      name = 'Git',
      mode = {'n','x'},
      body = '<leader>g',
      hint = [[

             	      Git

 _n_: next hunk   _s_: stage hunk   _r_: reset hunk
 _p_: prev hunk   _u_: undo stage   _R_: reset buffer
 _b_: blame line  _d_: diff this    _;_: LazyGit
 _B_: Blame Full 
      
 ]],
      config = {
	invoke_on_body = true,
        hint = {
          position = 'middle',
          show_name = false,
	  focusable = false,
          float_opts = {
            border = 'none',
          },
        },
        color = 'pink',
      },
      heads = {
        { 'n', gitsigns.next_hunk, { desc = 'next hunk' } },
        { 'p', gitsigns.prev_hunk, { desc = 'prev hunk' } },
        { 's', gitsigns.stage_hunk, { desc = 'stage hunk' } },
        { 'u', gitsigns.undo_stage_hunk, { desc = 'undo stage' } },
        { 'r', gitsigns.reset_hunk, { desc = 'reset hunk' } },
        { 'R', gitsigns.reset_buffer, { desc = 'reset buffer' } },
        { 'b', gitsigns.blame_line, { desc = 'blame line' } },
        { 'B', function() gitsigns.blame_line{full=true} end, { desc = 'blame full' } },
        { 'd', gitsigns.diffthis, { desc = 'diff this' } },
	{ ';', '<cmd>LazyGit<cr>', { desc = 'LazyGit' } },
        { 'q', nil, { exit = true } },
        { '<Esc>', nil, { exit = true } },
      }
    })
	vim.keymap.set({'n', 'x'}, '<leader>g', function()
      git_hydra:activate()
    end, { desc = 'Git Hydra' })
  end
}
