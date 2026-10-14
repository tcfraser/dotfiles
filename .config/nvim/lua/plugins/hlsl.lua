return {
    "beyondmarc/hlsl.vim",
    lazy = false,
    init = function()
        -- Recognize shader sources and includes before buffers are opened.
        vim.filetype.add({
            extension = {
                hlsl = "hlsl",
                hlsli = "hlsl",
            },
        })
    end,
}
