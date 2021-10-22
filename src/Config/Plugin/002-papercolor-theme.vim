"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara "
" Note		 :- Do not rename this file                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" First line ensures we can have full spectrum of colors
" if has('gui_running') || &term =='linux' || &t_Co < 256
"	set bg=dark
"	set background=dark
"	colorscheme atom-dark-256
" else
"	set t_Co=256
"	set background=light
"	colorscheme PaperColor
" endif

" Set default color scheme
syntax off
set bg=dark
set background=dark
colorscheme atom-dark-256
let g:airline_theme='base16_google'
" Let syntax enable after colour scheme apply for better highlight
syntax on

" I wanted to use F5 key for filetype so comment it
" map <F5> :call ChangeColorScheme()<CR>
function! ChangeColorScheme()
	try
		if (&background == "light")
			syntax off
			let g:airline_theme='base16_google'
			set background=dark
			colorscheme atom-dark-256
			syntax on
		else
			syntax off
			let g:airline_theme='papercolor'
			set background=light
			colorscheme PaperColor
			syntax on
		endif
	catch
		throw exception
	endtry
endfunction
