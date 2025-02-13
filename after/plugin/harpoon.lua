local harpoon = require("harpoon")

-- REQUIRED Setup
harpoon:setup({
    settings = {
        save_on_toggle = true,  -- Save when toggling the menu
    }
})

-- Function to open Harpoon with customized UI
local function open_custom_harpoon_menu()
    harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Rounded borders
        title = "Harpoon",  -- Set a custom title
        title_pos = "center", -- Center the title
        height_in_lines = 12, -- Increase height
        ui_width_ratio = 0.75, -- Make the menu 50% of the editor width
        ui_max_width = 150, -- Cap width at 80 columns
    })
end

-- Apply Floating Window Styling
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Transparent background
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#9ca8f7", bg = "none" }) -- Border color

-- Keybinding to open Harpoon menu with rounded corners and transparency
vim.keymap.set("n", "<leader>lv", open_custom_harpoon_menu, { desc = "Open Styled Harpoon Menu" })

-- basic telescope configuration
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local entries = {}

    for _, item in ipairs(harpoon_files.items) do
        local full_path = item.value
        local filename = full_path:match("([^/]+)$") or full_path -- Extracts last part (filename or last directory)

        table.insert(entries, { full_path = full_path, display = filename })
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = entries,
            entry_maker = function(entry)
                return {
                    value = entry.full_path, -- Keep full path for selection
                    display = entry.display, -- Show only filename
                    ordinal = entry.full_path, -- Ensure uniqueness in sorting
                }
            end,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>la", function() harpoon:list():add() end)



