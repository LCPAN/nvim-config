let g:python3_host_prog = '/usr/bin/python3'
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
 Plug 'gregsexton/gitv', {'on': ['Gitv']}  "git
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'terryma/vim-multiple-cursors'   "多光标
 Plug 'justinmk/vim-sneak'
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-surround'
 Plug 'liuchengxu/vista.vim'

" Multiple Plug commands can be written in a single line using | separators
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Initialize plugin system
 call plug#end()

  " 定义快捷键的前缀，即<Leader>
 let mapleader=";"

" LanguageClient
 set hidden
 let g:LanguageClient_autoStart = 1
 "let g:LanguageClient_devel = 1
 let g:LanguageClient_loggingLevel = 'DEBUG'
 " no need for diagnostics, we're going to use neomake for that
 let g:LanguageClient_diagnosticsEnable  = 0
 let g:LanguageClient_signColumnAlwaysOn = 1
 let g:LanguageClient_useFloatingHover= 1
 let g:LanguageClient_selectionUI = 'fzf'
 let g:LanguageClient_serverCommands = {
  \ 'c': ['/home/lcp/self/softwave/ccls/bin/ccls', '--log-file=/tmp/cc.log', '--init={"cache": {"directory": "/tmp/ccls-cache"}}'],
  \ 'cpp': ['/home/lcp/self/softwave/ccls/bin/ccls', '--log-file=/tmp/cc.log', '--init={"cache": {"directory": "/tmp/ccls-cache"}}'],
  \ }

 " Put this outside of the plugin section
 " <leader>lf to fuzzy find the symbols in the current document
 nnoremap <silent> <leader>hv :call LanguageClient#textDocument_hover()<CR>
 nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>
 nnoremap <silent> <leader>fm :call LanguageClient_textDocument_formatting()<CR>

" fzf
 " Default fzf layout
 " - down / up / left / right
 let g:fzf_layout = { 'down': '~40%' }
 " Customize fzf colors to match your color scheme
 "let g:fzf_colors =
 "\ { 'fg':      ['fg', 'Normal'],
 "\ 'bg':      ['bg', 'Normal'],
 "\ 'hl':      ['fg', 'Comment'],
 "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
 "\ 'hl+':     ['fg', 'Statement'],
 "\ 'info':    ['fg', 'PreProc'],
 "\ 'border':  ['fg', 'Ignore'],
 "\ 'prompt':  ['fg', 'Conditional'],
 "\ 'pointer': ['fg', 'Exception'],
 "\ 'marker':  ['fg', 'Keyword'],
 "\ 'spinner': ['fg', 'Label'],
 "\ 'header':  ['fg', 'Comment'] }
 " word under cursor
 nnoremap <leader>R :exec "Rg ".expand("<cword>")<CR>
 " search for visual selection
 "vnoremap // "hy:exec "Rg ".escape('<C-R>h', "/\.*$^~[()")<cr>
 
 autocmd! VimEnter * command! -bang -nargs=* Rg
   \ call fzf#vim#grep(
   \   'rg --column --smart-case --line-number --color=always --no-heading --fixed-strings --follow --glob "!.git/*" '.shellescape(<q-args>), 1,
   \   <bang>0 ? fzf#vim#with_preview('up:60%')
   \           : fzf#vim#with_preview('left:50%:hidden', '?'),
   \   <bang>0)
 
 nnoremap <leader>, :Files<CR>
 nnoremap <leader>bu :Buffers<CR>
 nnoremap <leader>li :Lines<CR>
 " vertical split
 nnoremap <leader>. :call fzf#run({'sink': 'e', 'left': '40%'})<CR>

" deoplete
" Enable deoplete when InsertEnter.
  let g:deoplete#enable_at_startup = 1
  autocmd InsertEnter * call deoplete#enable()

set completeopt+=noinsert

"NerdTree
 map <F3> :NERDTreeToggle<CR>

"ultisnips
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsListSnippets = '<C-Tab>'           " 弹出UltiSnips的可用列表,<C-Tab>映射
 let g:UltiSnipsJumpForwardTrigger = '<Tab>'       " <Tab>跳转的到下一个代码块可编辑区
 let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'    " <S-Tab>跳转到上一个代码块可编辑区

" vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

 nmap <Leader>ba <C-O>

 set t_Co=256

"vim-airline
 let g:airline_theme='papercolor'
  set laststatus=2
 set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
 "let g:airline_detect_whitespace = 0 "关闭空白符检测
 let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
 "let g:airline_statusline_ontop = 1
 "let g:airline_theme = 'bubblegum' "设定主题
 "let g:airline_theme = 'badwolf' "设定主题
 "let g:airline_theme = 'luna' "设定主题
 let g:airline_theme = 'molokai'
 "let g:airline_theme = 'sol'
 "let g:airline_theme = 'murmur'
 "let g:airline_theme = 'hybridline'
 "let g:airline_theme = 'papercolor'
 "let g:airline_theme = 'understated'
 "let g:airline_theme = 'wombat'
 "let g:airline_section_b = '%{strftime("%c")}'
 "let g:airline_section_y = 'BN: %{bufnr("%")}'
 let g:airline_detect_paste=1
 "tabline中当前buffer两端的分隔字符
 let g:airline#extensions#tabline#left_sep = '◀'
 "tabline中未激活buffer两端的分隔字符
 let g:airline#extensions#tabline#left_alt_sep = '|'

 let g:airline#extensions#tavline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1
 "tabline中buffer显示编号
 let g:airline#extensions#tabline#buffer_idx_mode = 1
 nmap <leader>1 <Plug>AirlineSelectTab1
 nmap <leader>2 <Plug>AirlineSelectTab2
 nmap <leader>3 <Plug>AirlineSelectTab3
 nmap <leader>4 <Plug>AirlineSelectTab4
 nmap <leader>5 <Plug>AirlineSelectTab5
 nmap <leader>6 <Plug>AirlineSelectTab6
 nmap <leader>7 <Plug>AirlineSelectTab7
 nmap <leader>8 <Plug>AirlineSelectTab8
 nmap <leader>9 <Plug>AirlineSelectTab9
 nmap <leader>bp <Plug>AirlineSelectPrevTab
 nmap <leader>bn <Plug>AirlineSelectNextTab

"auto-pairs
 let g:AutoPairsFlyMode = 0

"auto-pairs
 function! NearestMethodOrFunction() abort
   return get(b:, 'vista_nearest_method_or_function', '')
 endfunction
 set statusline+=%{NearestMethodOrFunction()}
 autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
 let g:vista_echo_cursor_strategy = 'floating_win'
 let g:vista_default_executive = 'lcn'

 nnoremap <F5> :Vista lcn<CR>
 nnoremap <F6> :Vista finder fzf<CR>

 nnoremap <F9> :so ~/.config/nvim/init.vim<CR>

 noremap <silent> <expr> j (v:count == 0 ? 'gj':'j')
 noremap <silent> <expr> k (v:count == 0 ? 'gk':'k')

 inoremap <C-C> <ESC>

" 跳转至右方的窗口
 nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
 nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
 nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
 nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
 nmap <Leader>pa %
" 定义快捷键保存当前窗口内容
 nmap <Leader>wt :w<CR>
 nmap <Leader>qt :q<CR>
 nmap <Leader>wq :wq<CR>

 nmap <Leader>sp "+p<CR>

"基于缩进或语法进行代码折叠
"set foldmethod=indent
 set foldmethod=syntax

" 启动 vim 时关闭折叠代码
 set nofoldenable

 syntax enable
"设置（软）制表符宽度为4
 set tabstop=2
 set et
 set softtabstop=2
"设置缩进的空格数为4
 set shiftwidth=4
 set smartindent   " 开启新行时使用智能自动缩进"
"设置使用 C/C++ 语言的自动缩进方式
"set cindent
"开启行号显示
 set number
"使用相对行号
 set relativenumber
"光标离窗口上下边界5行时窗口自动滚动
 set scrolloff=5
 set mouse=
