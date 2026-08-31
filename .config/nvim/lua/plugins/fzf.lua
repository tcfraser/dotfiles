return {
    "ibhagwan/fzf-lua",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    keys = {
        {
            "<leader>f",
            "<cmd>FzfLua files<CR>",
            desc = "Find files",
        },

        {
            "<leader>b",
            "<cmd>FzfLua buffers<CR>",
            desc = "Find buffers",
        },

        {
            "<leader>g",
            "<cmd>FzfLua live_grep<CR>",
            desc = "Live grep",
        },
    },
}
