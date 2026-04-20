return {
  'YouSame2/inlinediff-nvim',
  cmd = 'InlineDiff',
  keys = {
    {
      '<leader>gdt',
      '<cmd>InlineDiff toggle<cr>',
      desc = 'InlineDiff | Toggle',
    },
    {
      '<leader>gdr',
      '<cmd>InlineDiff refresh<cr>',
      desc = 'InlineDiff | Refresh',
    },
  },
  config = true,
}
