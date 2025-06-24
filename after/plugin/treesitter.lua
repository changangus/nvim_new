require("nvim-treesitter.configs").setup({
	filetype_to_parsername = {
		mdx = "markdown",
	},

	indent = {
		enable = true,
	},
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "markdown", "lua", "vim", "query", "javascript", "typescript", "python" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		
		-- Disable for large files to prevent performance issues
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

-- Add error handling for treesitter window issues
local orig_redraw = vim.api.nvim__redraw
vim.api.nvim__redraw = function(opts)
	local ok, err = pcall(orig_redraw, opts)
	if not ok and string.match(err, "Invalid window id") then
		-- Silently ignore invalid window id errors during redraw
		return
	elseif not ok then
		error(err)
	end
end
