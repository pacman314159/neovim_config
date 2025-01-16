vim.g.vimtex_compiler_method = 'pdflatex'
-- vim.g.vimtex_compiler_method = 'latexrun'
vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_compiler_latexrun_engines = {
--   pdflatex = "pdflatex",
-- }
vim.g.vimtex_compiler_latexmk = {
  out_dir = "build"
}
vim.g.Tex_MultipleCompileFormats = 'pdf,bib,pdf'
