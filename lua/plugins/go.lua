return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.gopls.settings.gopls.hints.assignVariableTypes = false
      opts.servers.gopls.settings.gopls.hints.parameterNames = false
      opts.servers.gopls.settings.gopls.hints.rangeVariableTypes = false
    end,
  },
}
