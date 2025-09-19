return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('nvim-tree').setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
        view = {
          width = 30,
          side = 'left',
          adaptive_size = true,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end,
  }
}
