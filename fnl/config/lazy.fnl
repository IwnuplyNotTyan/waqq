(local lazy (require :lazy))

(lazy.setup {
  :spec [{:import :plugins}
         {:import :plugins.lsp}]
  :defaults {:lazy false
             :version false}})
