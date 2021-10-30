set encoding=UTF-8

let g:python3_host_prog = '/usr/bin/python3'
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
 Plug 'tpope/vim-fugitive'  "git
 Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'ryanoasis/vim-devicons'  "Adds file type icons to Vim plugins

 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
 endif
 Plug 'Shougo/echodoc.vim'

 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'mg979/vim-visual-multi', {'branch': 'master'}  "多光标
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-surround'
 Plug 'liuchengxu/vista.vim' "Viewer & Finder for LSP symbols and tags
 Plug 'preservim/nerdcommenter' "Comment functions
 Plug 'Chiel92/vim-autoformat'
 Plug 'voldikss/vim-floaterm'
 Plug 'kenn7/vim-arsync'  "async local files to the remote server

" Multiple Plug commands can be written in a single line using | separators
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

 Plug 'rust-lang/rust.vim'

 Plug 'skywind3000/asyncrun.vim'
 Plug 'vimwiki/vimwiki'
 Plug 'mbbill/undotree'

 Plug 'chrisbra/csv.vim'
 "Plug 'christoomey/vim-tmux-navigator'
 Plug 'puremourning/vimspector'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
 call plug#end()

 set t_Co=256

"基于缩进或语法进行代码折叠
"set foldmethod=indent
 set foldmethod=syntax

set nocompatible
filetype plugin on
" 启动 vim 时关闭折叠代码
 set nofoldenable

 syntax enable
"设置（软）制表符宽度为4
 set tabstop=2
 set et
 set softtabstop=2
"设置缩进的空格数为4
 set shiftwidth=2
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

" 定义快捷键的前缀，即<Leader>
 let mapleader=";"

" vim-autoformat
 noremap <F2> :Autoformat<CR>
 let g:formatter_yapf_style = 'pep8'

" vim-floaterm
 let g:floaterm_keymap_toggle = '<F4>'
 tnoremap <silent> <leader>tc   <C-\><C-n>:FloatermNew<CR>
 tnoremap <silent> <leader>tp   <C-\><C-n>:FloatermPrev<CR>
 tnoremap <silent> <leader>tn   <C-\><C-n>:FloatermNext<CR>
 tnoremap <silent> <leader>tt   <C-\><C-n>:FloatermToggle<CR>

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
 nnoremap <leader>, :Files<CR>
 nnoremap <leader>bu :Buffers<CR>
 nnoremap <leader>li :Lines<CR>

" deoplete
" Enable deoplete when InsertEnter.
  let g:deoplete#enable_at_startup = 1
  autocmd InsertEnter * call deoplete#enable()
  call deoplete#custom#source('LanguageClient',
              \ 'min_pattern_length',
              \ 2)
  set completeopt+=menu,preview,noinsert

" echodoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" LanguageClient
 set hidden
 let g:LanguageClient_autoStart = 1
 " let g:LanguageClient_devel = 1
 let g:LanguageClient_loggingLevel = 'WARN'
 " let g:LanguageClient_loggingLevel = 'DEBUG'
 let g:LanguageClient_loggingFile =  expand('/tmp/LanguageClient.log')
 " no need for diagnostics, we're going to use neomake for that
 let g:LanguageClient_diagnosticsEnable  = 1
 " let g:LanguageClient_diagnosticsSignsMax = 10
 let g:LanguageClient_signColumnAlwaysOn = 1
 let g:LanguageClient_loadSettings = 1
 let g:LanguageClient_settingsPath = './settings.json'
 let g:LanguageClient_useFloatingHover= 1
 let g:LanguageClient_selectionUI = 'fzf'
 let g:LanguageClient_serverCommands = {
  \ 'c': ['/home/lcp/self/softwave/ccls/bin/ccls', '--log-file=/tmp/cc.log'],
  \ 'cpp': ['/home/lcp/self/softwave/ccls/bin/ccls', '--log-file=/tmp/cc.log'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'go': ['gopls'],
  \ }
  " \ 'python': ['pyls'],

" Run gofmt on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

 " Put this outside of the plugin section
 " <leader>lf to fuzzy find the symbols in the current document
 function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  "nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  "nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  "nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  "nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  "nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
  " bases
  "nnoremap <leader>xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<CR>
  " bases of up to 3 levels
  "nnoremap <leader>xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<CR>
  " derived
  "nnoremap <leader>xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<CR>
  " derived of up to 3 levels
  "nnoremap <leader>xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<CR>

  "" caller
  "nnoremap <leader>xc :call LanguageClient#findLocations({'method':'$ccls/call'})<CR>
  "" callee
  "nnoremap <leader>xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<CR>

  "" $ccls/member
  "" nested classes / types in a namespace
  "nnoremap <leader>xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<CR>
  "" member functions / functions in a namespace
  "nnoremap <leader>xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<CR>
  "" member variables / variables in a namespace
  "nnoremap <leader>xm :call LanguageClient#findLocations({'method':'$ccls/member'})<CR>

  "nn <silent> xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
  "nn <silent> xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
  "nn <silent> xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
  "nn <silent> xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
 endfunction()

 augroup LSP
  autocmd!
  autocmd FileType go,rust,cpp,c call SetLSPShortcuts()
 augroup END

"NerdTree
 map <F3> :NERDTreeToggle<CR>

"ultisnips
 let g:UltiSnipsExpandTrigger="<TAB>"
 let g:UltiSnipsListSnippets = '<C-Tab>'           " 弹出UltiSnips的可用列表,<C-Tab>映射
 let g:UltiSnipsJumpForwardTrigger = '<Tab>'       " <Tab>跳转的到下一个代码块可编辑区
 let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'    " <S-Tab>跳转到上一个代码块可编辑区

" vim-visual-multi
"let g:multi_cursor_use_default_mapping=0
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

 nmap <Leader>ba <C-o>
 nmap <Leader>fr <C-i>

"vim-airline
 let g:airline_theme='papercolor'
 set laststatus=2
 set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
 "let g:airline_detect_whitespace = 0 "关闭空白符检测
 let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
 "let g:airline_statusline_ontop = 1
 "let g:airline_section_b = '%{strftime("%c")}'
 "let g:airline_section_y = 'BN: %{bufnr("%")}'
 let g:airline_detect_paste=1

 " enable tabline
 let g:airline#extensions#tabline#enabled = 1
 "tabline中当前buffer两端的分隔字符
 let g:airline#extensions#tabline#left_sep = '◀'
 "tabline中未激活buffer两端的分隔字符
 let g:airline#extensions#tabline#left_alt_sep = '|'
 let g:airline#extensions#tabline#buffer_nr_show = 1
 "tabline中buffer显示编号
 let g:airline#extensions#tabline#buffer_idx_mode = 1
 let g:airline_powerline_fonts = 1

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
 function! NearestMethodOrFunction() abort
   return get(b:, 'vista_nearest_method_or_function', '')
 endfunction
 set statusline+=%{NearestMethodOrFunction()}
 autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
 let g:vista_echo_cursor_strategy = 'floating_win'
 let g:vista_default_executive = 'lcn'

"auto-pairs
 let g:AutoPairsFlyMode = 0

" undotree
 " set the undotree window layout
 let g:undotree_WindowLayout = 2
 " the undotree window will get focus after being opened
 let g:undotree_SetFocusWhenToggle = 1
 nnoremap <F5> :UndotreeToggle<CR>

" nerdcommenter

" asyncrun
 " automatically open quickfix window when AsyncRun command is executed
 " set the quickfix window 6 lines height.
 let g:asyncrun_open = 8
 let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
 " F8 to toggle quickfix window
 nnoremap <F8> :call asyncrun#quickfix_toggle(6)<CR>
 nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw make<CR>
 nnoremap <silent> <F6> :AsyncRun -cwd=<root> cmake -S .  -B build<CR>

" vim-arsync
 nnoremap <F9> :ARsyncUpDelete<CR>
 nnoremap <F10> :ARsyncDown<CR>

" vim-tmux-navigator
 "let g:tmux_navigator_no_mappings = 1
 "" Write all buffers before navigating from Vim to tmux pane
 "" 1 -- :update (write the current buffer, but only if changed)
 "" 2 -- :wall (write all buffers)
 "let g:tmux_navigator_save_on_switch = 2
 "nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
 "nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
 "nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
 "nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
 "nnoremap <silent> <C-;> :TmuxNavigatePrevious<CR>
 
" vim-go
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_operators = 1
 " Auto formatting and importing
 let g:go_fmt_autosave = 1
 let g:go_fmt_command = "goimports"
 let g:go_auto_type_info = 1

 nnoremap <F11> :Vista lcn<CR>

 nnoremap <F12> :so ~/.config/nvim/init.vim<CR>

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
