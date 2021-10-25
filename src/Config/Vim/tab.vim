
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara "
" Note		 :-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" like <leader>n one new tab
nnoremap <leader>t :tabnew<cr>

" Tab options (as in Vim GUI Tabs)
" <C-t> Opens a new tab, <C-w> closes current tab
" Remember, gt goes to next tab, gT goes to previous; easier than using firefox
" control sequences
" I don't use tabs often, so I've disabled these for now.
" :nmap <C-t> :tabnew<CR>
" :imap <C-t> <ESC>:tabnew<CR>
" :nmap <C-w> :tabclose<CR>
" :imap <C-w> <ESC>:tabclose<CR>
nnoremap <C-Left> :tabp<CR>
inoremap <C-Left> <ESC>:tabp<CR>
nnoremap <C-Right> :tabn<CR>
inoremap <C-Right> <ESC>:tabn<CR>

" Conflicts with multi cursor
" nnoremap <C-Up> :tabfirst<CR>
" inoremap <C-Up> <ESC>:tabfirst<CR>
" nnoremap <C-Down> :tablast<CR>
" inoremap <C-Down> <ESC>:tablast<CR>

" In tty right and left key will not work
nnoremap <leader>tp :tabp<CR>
inoremap <leader>tp <ESC>:tabp<CR>
nnoremap <leader>tn :tabn<CR>
inoremap <leader>tn <ESC>:tabn<CR>
nnoremap <leader>tf :tabfirst<CR>
inoremap <leader>tf <ESC>:tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
inoremap <leader>tl <ESC>:tablast<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Open last closed tab into split for fast navigation
augroup bufclosetrack
	au!
	autocmd WinLeave * let g:lastWinName = @%
augroup END
function! LastWindow()
	exe "split " . g:lastWinName
endfunction

" command -nargs=0 LastWindow call LastWindow()
nnoremap <leader>T :call LastWindow()<cr>

" Page tabs
"nnoremap <C-n> :tabe<CR>:Explore!<CR>
" nnoremap <C-k> gt
" nnoremap <C-j> gT
" nnoremap <C-1> 1gt
" nnoremap <C-2> 2gt
" nnoremap <C-3> 3gt
" nnoremap <C-4> 4gt
" nnoremap <C-5> 5gt
" nnoremap <C-6> 6gt
" nnoremap <C-7> 7gt
" nnoremap <C-8> 8gt
" nnoremap <C-9> 9gt
" nnoremap <C-0> :tablast<CR>

" Keyboard tab , shift-tab
" https://vim.fandom.com/wiki/Shifting_blocks_visually
" nnoremap <Tab> >>
" nnoremap <S-Tab> <<
" nnoremap <Tab> >>_
" nnoremap <S-Tab> <<_
" inoremap <S-Tab> <C-D>
" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv
