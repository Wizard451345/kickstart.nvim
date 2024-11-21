return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		-- Harpoon telescope configuration
		-- local conf = require("telescope.config").values
		-- local function toggle_telescope(harpoon_files)
		-- 	local file_paths = {}
		-- 	for _, item in ipairs(harpoon_files.items) do
		-- 		table.insert(file_paths, item.value)
		-- 	end
		--
		-- 	require("telescope.pickers")
		-- 		.new({}, {
		-- 			prompt_title = "Harpoon",
		-- 			finder = require("telescope.finders").new_table({
		-- 				results = file_paths,
		-- 			}),
		-- 			previewer = conf.file_previewer({}),
		-- 			sorter = conf.generic_sorter({}),
		-- 		})
		-- 		:find()
		-- end

		local function toggle_telescope(harpoon_files)
			local finder = function()
				local paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(paths, item.value)
				end

				return require("telescope.finders").new_table({
					results = paths,
				})
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					previewer = false,
					sorter = require("telescope.config").values.generic_sorter({}),
					layout_config = {
						height = 0.4,
						width = 0.5,
						prompt_position = "top",
						preview_cutoff = 120,
					},
          -- Removes Files from the Telescope picker. From GitHub!
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<C-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_bufnr)

							table.remove(harpoon_files.items, selected_entry.index)
							current_picker:refresh(finder())
						end)
						return true
					end,
				})
				:find()
		end

		-- Harpoon Shortcuts
		vim.keymap.set("n", "<leader>cH", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
		vim.keymap.set("n", "<leader>cA", function()
			harpoon:list():add()
		end, { desc = "Harpoon Mark File" })
		-- vim.keymap.set("n", "<leader>cH", function()
		--  harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end, { desc = "Harpoon Menu" })
		vim.keymap.set("n", "<leader><Left>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon CyclePrev" })
		vim.keymap.set("n", "<leader><Right>", function()
			harpoon:list():next()
		end, { desc = "Harpoon CycleNext" })
	end,
}

-- vim: ts=2 sts=2 sw=2 et
