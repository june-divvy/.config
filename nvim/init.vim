scriptencoding utf-8

""" Vim-Plug
call plug#begin()

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'

" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'

" Functionalities
"
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
"Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/loremipsum'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'Shougo/denite.nvim'

" Functionalities for javascript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Entertainment
"Plug 'ryanss/vim-hackernews'

call plug#end()

""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

""" Coloring
syntax on
color dracula
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number
set title
set splitright

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
set completeopt-=preview


" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" Ale Configuration
let g:ale_fixers = {
            \ 'javascript' : ['eslint']
            \ }
let g:ale_fix_on_save = 1

" ctrlp configuration
""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2


" Javascript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

"" coc-vim

set cmdheight=2
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>":
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.')-1
    return !col || getline('.')[col - 1]=~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
"call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
"
"" Use ripgrep in place of "grep"
"call denite#custom#var('grep', 'command', ['rg'])
"
"" Custom options for ripgrep
""   --vimgrep:  Show results with every match on it's own line
""   --hidden:   Search hidden directories and files
""   --heading:  Show the file name above clusters of matches from each file
""   --S:        Search case insensitively if the pattern is all lowercase
"call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
"
"" Recommended defaults for ripgrep via Denite docs
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"
"" Remove date from buffer list
"call denite#custom#var('buffer', 'date_format', '')
"
"" Custom options for Denite
""   auto_resize             - Auto resize the Denite window height automatically.
""   prompt                  - Customize denite prompt
""   direction               - Specify Denite window direction as directly below current pane
""   winminheight            - Specify min height for Denite window
""   highlight_mode_insert   - Specify h1-CursorLine in insert mode
""   prompt_highlight        - Specify color of prompt
""   highlight_matched_char  - Matched characters highlight
""   highlight_matched_range - matched range highlight
"let s:denite_options = {'default' : {
"\ 'split': 'floating',
"\ 'start_filter': 1,
"\ 'auto_resize': 0,
"\ 'source_names': 'short',
"\ 'prompt': 'λ:',
"\ 'statusline': 0,
"\ 'highlight_matched_char': 'WildMenu',
"\ 'highlight_matched_range': 'Visual',
"\ 'highlight_filter_background': 'StatusLine',
"\ 'highlight_prompt': 'StatusLine',
"\ 'highlight_window_background': 'Visual',
"\ 'winrow': 20,
"\ 'wincol': 3
"\ }}
"" 'vertical_preview': 1
"
"" Loop through denite options and enable them
"function! s:profile(opts) abort
"  for l:fname in keys(a:opts)
"    for l:dopt in keys(a:opts[l:fname])
"      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"    endfor
"  endfor
"endfunction
"
"call s:profile(s:denite_options)
"catch
"  echo 'Denite not installed. It should work after running :PlugInstall'
"endtry
""" Custom Functions

" Trim Whitespaces
" command! -nargs=1 Floatprev call FloatingPreview(<f-args>>)
" command! Floatprev call FloatingPreview()

" function! FloatingPreview()
    " execute ('badd ~/.config/nvim/coc-settings.json')
    " call nvim_open_win('~/.config/nvim/coc-settings.json', 0, {  'relative':'win',  'width' : winwidth(0)/2-10,  'height' : winheight(0)/2,  'bufpos': [ 20, 23 ]})
" endfunction

function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badcat'
    color zazen
    IndentLinesEnable
endfunction

""" Custom Mappings
set mouse=a
set clipboard=unnamedplus
let mapleader=","
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <C-\> :NERDTreeFind<CR>
"nmap <leader>w :TagbarToggle<CR>
" nmap <leader>ee :Colors<CR>
" nmap <leader>ea :AirlineTheme 
" nmap <leader>e1 :call ColorDracula()<CR>
" nmap <leader>e2 :call ColorSeoul256()<CR>
" nmap <leader>e3 :call ColorForgotten()<CR>
" nmap <leader>e4 :call ColorZazen()<CR>
" nmap <leader>r :so ~/.config/nvim/init.vim<CR>
" nmap <leader>t :call TrimWhitespace()<CR>
" xmap <leader>a gaip*
" nmap <leader>a gaip*
" nmap <leader>s <C-w>s<C-w>j:terminal<CR>
" nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
" nmap <leader>d <Plug>(pydocstring)
" nmap <leader>f :Files<CR>
" nmap <leader>g :Goyo<CR>
" nmap <leader>h :RainbowParentheses!!<CR>
" nmap <leader>j :set filetype=journal<CR>
" nmap <leader>k :ColorToggle<CR>
" nmap <leader>l :Limelight!!<CR>
" xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
"nmap <leader>n :HackerNews best<CR>J
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
"" === Denite shorcuts === "
""   ;         - Browser currently open buffers
""   <leader>t - Browse list of files in current directory
""   <leader>g - Search current directory for occurences of given term and close window if no results
""   <leader>j - Search current directory for occurences of word under cursor
"nmap ; :Denite buffer<CR>
"nmap <c-p> :DeniteProjectDir file/rec <CR>
"            "\ -auto-action=preview<CR>
"  "\ denite#do_map('do_action', 'preview', '-split=vertical')
"nnoremap <c-g> :<C-u>Denite grep:. -no-empty<CR>
"nnoremap <c-t> :<C-u>DeniteCursorWord grep:.<CR>
"
"" Define mappings while in 'filter' mode
""   <C-o>         - Switch to normal mode inside of search results
""   <Esc>         - Exit denite window in any mode
""   <CR>          - Open currently selected file in any mode
"autocmd FileType denite-filter call s:denite_filter_my_settings()
"function! s:denite_filter_my_settings() abort
"  imap <silent><buffer> <C-o>
"  \ <Plug>(denite_filter_quit)
"  inoremap <silent><buffer><expr> <Esc>
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> <Esc>
"  \ denite#do_map('quit')
"  inoremap <silent><buffer><expr> <leader>o
"  \ denite#do_map('do_action')
"  inoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action', 'vsplit')
"  inoremap <silent><buffer><expr> <S-CR>
"  \ denite#do_map('do_action', 'split')
"endfunction
"
"" Define mappings while in denite window
""   <CR>        - Opens currently selected file
""   q or <Esc>  - Quit Denite window
""   d           - Delete currenly selected file
""   p           - Preview currently selected file
""   <C-o> or i  - Switch to insert mode inside of filter prompt
"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"  nnoremap <silent><buffer><expr> o
"  \ denite#do_map('do_action')
"  nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action', 'vsplit')
"  nnoremap <silent><buffer><expr> <S-CR>
"  \ denite#do_map('do_action', 'split')
"  nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> <Esc>
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"  nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"  nnoremap <silent><buffer><expr> i
"  \ denite#do_map('open_filter_buffer')
"  nnoremap <silent><buffer><expr> <C-o>
"  \ denite#do_map('open_filter_buffer')
"endfunction
"
" Fzf ------------------------------
"
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'
" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)
  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1
  let opts = {
        \ 'relative': 'ditor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }
" open the new window, floating, and enter to it
call nvim_open_win(buf, v:true, opts)
endfunction
" file finder mapping
nmap ,f :Files<CR>
" general code finder in all files mapping
nmap ,F :Rg<CR>
" commands finder mapping
nmap ,c :Commands<CR>
" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
" Ripgrep setting with preview window
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --no-heading --fixed-strings --line-number --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%'),
      \   <bang>0)e

