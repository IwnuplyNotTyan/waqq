return {
    "rebelot/kanagawa.nvim", 
    priority = 1000, 
    config = function()
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,      -- define vim.g.terminal_color_{0,17}
            colors = {                  -- add/modify theme and palette colors
                palette = {
                    -- Override dragon palette with your colors
                    dragonBlack0 = "#0B0F10",    -- your background
                    dragonBlack1 = "#101415",    -- your color0
                    dragonBlack2 = "#131718",    -- your color8
                    dragonWhite = "#c5c8c9",     -- your foreground
                    dragonGray = "#c4c4c4",      -- your color7
                    dragonGray2 = "#cccccc",     -- your color15
                    
                    -- Your color palette
                    dragonRed = "#df5b61",       -- your color1
                    dragonOrange = "#ee6a70",    -- your color9
                    dragonGreen = "#87c7a1",     -- your color2
                    dragonGreen2 = "#96d6b0",    -- your color10
                    dragonYellow = "#de8f78",    -- your color3
                    dragonOrange2 = "#ffb29b",   -- your color11
                    dragonBlue = "#6791c9",      -- your color4
                    dragonBlue2 = "#7ba5dd",     -- your color12
                    dragonViolet = "#bc83e3",    -- your color5
                    dragonViolet2 = "#cb92f2",   -- your color13
                    dragonAqua = "#70b9cc",      -- your color6
                    dragonTeal = "#7fc8db",      -- your color14
                },
                theme = { 
                    wave = {}, 
                    lotus = {}, 
                    dragon = {
                        -- Override dragon theme colors
                        ui = {
                            bg = "#0B0F10",          -- your background
                            bg_dim = "#101415",      -- slightly darker
                            bg_m1 = "#131718",       -- darker background
                            fg = "#c5c8c9",          -- your foreground
                            fg_dim = "#c4c4c4",      -- dimmed foreground
                            fg_reverse = "#0B0F10",  -- reverse for selections
                        },
                        syn = {
                            string = "#87c7a1",      -- green for strings
                            variable = "#c5c8c9",    -- foreground for variables
                            number = "#de8f78",      -- yellow for numbers
                            constant = "#bc83e3",    -- magenta for constants
                            identifier = "#7ba5dd",  -- blue for identifiers
                            parameter = "#7fc8db",   -- cyan for parameters
                            fun = "#6791c9",         -- blue for functions
                            statement = "#df5b61",   -- red for statements
                            keyword = "#ee6a70",     -- bright red for keywords
                            operator = "#c5c8c9",    -- foreground for operators
                            preproc = "#cb92f2",     -- bright magenta for preprocessor
                            type = "#96d6b0",        -- bright green for types
                            regex = "#ffb29b",       -- bright yellow for regex
                            deprecated = "#c4c4c4",  -- gray for deprecated
                            comment = "#c4c4c4",     -- gray for comments
                            punct = "#cccccc",       -- bright white for punctuation
                            special1 = "#70b9cc",    -- cyan for special
                            special2 = "#de8f78",    -- yellow for special
                            special3 = "#bc83e3",    -- magenta for special
                        },
                        diff = {
                            add = "#87c7a1",         -- green for additions
                            delete = "#df5b61",      -- red for deletions
                            change = "#de8f78",      -- yellow for changes
                            text = "#6791c9",        -- blue for changed text
                        },
                        diag = {
                            error = "#df5b61",       -- red for errors
                            warn = "#de8f78",        -- yellow for warnings
                            info = "#6791c9",        -- blue for info
                            hint = "#70b9cc",        -- cyan for hints
                        },
                    }, 
                    all = {} 
                },
            },
            overrides = function(colors) -- add/modify highlights
                return {
                    -- Terminal colors to match your palette
                    Terminal = { bg = colors.palette.dragonBlack0, fg = colors.palette.dragonWhite },
                    -- Additional overrides can be added here
                }
            end,
            theme = "dragon",           -- Use dragon theme
            background = {              -- map the value of 'background' option to a theme
                dark = "dragon",        -- use dragon for dark
                light = "lotus"
            }
        })
        vim.cmd.colorscheme "kanagawa-dragon"
    end
}
