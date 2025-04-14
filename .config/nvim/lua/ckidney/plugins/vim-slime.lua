return {
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = {
				socket_name = "default",
				target_pane = "1",
			}
			vim.g.slime_paste_file = os.getenv("HOME") .. "/.slime_paste"
			vim.g.slime_dont_ask_default = 1
		end,

		config = function()
			-- ✅ Fixed: Send file contents as a string
			vim.keymap.set("n", "<leader>rc", function()
				local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
				local content = table.concat(lines, "\n")
				vim.fn["slime#send"](content)
			end, { desc = "Send current file contents to tmux via vim-slime" })

			-- Visual mode: Send selection
			vim.keymap.set("v", "<leader>rs", "<Plug>SlimeRegionSend", { desc = "Send selection to tmux" })
		end,
	},
}
