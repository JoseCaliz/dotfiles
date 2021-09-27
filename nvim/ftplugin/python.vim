" Una configuración necesaria para que pep8 funcione
set indentexpr=GetPythonPEPIndent(v:lnum)

" Una columna de color para saber cuando está larga la cosa
set colorcolumn=79

" Slime de esta manera envías un cpaste
let g:slime_python_ipython = 1

let g:python_pep8_indent_hang_closing=0

" Correr todo el script
nnoremap <Leader>r :IPythonCellRun<CR>

" Correr la celda y saltar a la siguiente
nnoremap <Leader>cn :IPythonCellExecuteCellJump<CR>

" Limpiar la ventan
nnoremap <Leader>cl :IPythonCellClear<CR>

" Corer celda actual
nnoremap <Leader>cc :IPythonCellExecuteCell<CR>

" Saltar a los cells headers
nnoremap <leader>cg :IPythonCellPrevCell<CR>
nnoremap <leader>cr :IPythonCellNextCell<CR>

" Correr el comando anterior
nnoremap <Leader>cp :IPythonCellPrevCommand<CR>

xmap <c-c><c-c> <Plug>SlimeRegionSend gvh<ESC>
imap <c-c><c-c> <ESC><Plug>SlimeParagraphSend i
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v <Plug>SlimeConfig
