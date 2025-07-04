[{1 :nvim-telescope/telescope.nvim
  :tag "0.1.4"
  :dependencies [:nvim-lua/plenary.nvim]
  :config (fn []
            (let [telescope (require :telescope)]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "vendor"]}})))}]
