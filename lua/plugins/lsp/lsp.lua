return {
	{'neovim/nvim-lspconfig',
 		 config = function()
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    --"gopls",        -- Go
    "harper_ls"	      -- Type Check
    --"nil_ls",       -- Nix
    --"ts_ls",        -- TypeScript/JavaScript
    --"lua_ls",       -- Lua
    --"html",         -- HTML
    --"cssls",        -- CSS
    --"eslint",       -- ESLint
  }
})

-- Set up nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- LSP settings (new vim.lsp.config / vim.lsp.enable API, see :help lspconfig-nvim-0.11)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Apply the completion capabilities to every server by default
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Key mappings + per-client tweaks, applied once for any LSP client that attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)

    -- ts_ls: defer formatting to a dedicated formatter instead of the LSP itself
    if client and client.name == 'ts_ls' then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})

-- Configure language servers
-- 1. Golang
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.config('kotlin_language_server', {
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "build.gradle.kts", ".git" },
  settings = {},
})

vim.lsp.config('basedpyright', {})

-- 2. Nix
vim.lsp.config('nil_ls', {
  settings = {
    ['nil'] = {
      formatting = {
        command = {"nixpkgs-fmt"},
      },
    },
  },
})

-- 3. TypeScript/JavaScript (for React as well)
-- (the formatting-provider override lives in the shared LspAttach autocmd above)
vim.lsp.config('ts_ls', {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
})

-- 4. ESLint
vim.lsp.config('eslint', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  settings = {
    workingDirectory = { mode = 'auto' },
  },
})

-- 5. Lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- HTML (for JSX/TSX)
vim.lsp.config('html', {
  filetypes = { "html", "javascriptreact", "typescriptreact" },
})

-- CSS
vim.lsp.config('cssls', {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Java
vim.lsp.config('jdtls', {})

-- Fennel (custom server, not one of lspconfig's built-in definitions)
vim.lsp.config('fennel_language_server', {
  cmd = {'/usr/bin/fennel'},
  filetypes = {'fennel'},
  root_markers = { "fnl" },
  settings = {
    fennel = {
      workspace = {
        library = vim.api.nvim_list_runtime_paths(),
      },
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
})

vim.lsp.config('rubocop', {})

-- Harper - Type Check
vim.lsp.config('harper_ls', {
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      workspaceDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongApostrophe = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000,
      ignoredLintsPath = "",
      excludePatterns = {}
    }
  }
})

-- Yaml & Docker
vim.lsp.config('yamlls', {})
vim.lsp.config('dockerls', {})

-- Turn all of the above on
vim.lsp.enable({
  'gopls',
  'kotlin_language_server',
  'basedpyright',
  'nil_ls',
  'ts_ls',
  'eslint',
  'lua_ls',
  'html',
  'cssls',
  'jdtls',
  'fennel_language_server',
  'rubocop',
  'harper_ls',
  'yamlls',
  'dockerls',
})

-- Add border to hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  	end},
}
