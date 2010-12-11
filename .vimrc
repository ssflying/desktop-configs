" set enc=utf-8
"Get out of VI's compatible mode..
" Basics {
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ambiwidth=double

set shiftwidth=4
"Turn on WiLd menu , enhanced tab completion
set wildmenu

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 72 characters.
  autocmd FileType text setlocal textwidth=72

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"Always show the statusline
set laststatus=2

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

""""" appearance
if has("gui_running")
     colorscheme darkblue
    set background=light
    set guicursor+=n-v-c:blinkon0
    if has("gui_gtk2")
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
        set guifontwide=Microsoft\ Yahei\ 13,WenQuanYi\ Zen\ Hei\ 13
    elseif has("gui_win32")
            "set guifont=DejaVu_Sans_Mono:h12
            "set guifont=Courier_New:h10:cANSI
            "set guifontwide=微软雅黑:h10
    elseif has("x11")
        " Also for GTK 1
        set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    endif
endif
if has("unix")
    if $TERM == 'linux'
        set background=dark
    elseif $TERM == 'screen'
        set background=light
        set ttymouse=xterm
    elseif $TERM == 'rxvt'
        set background=dark
        set ttymouse=xterm
    elseif $TERM == 'xterm'
	set background=light
        set ttymouse=xterm
    else
        set background=dark
    endif
elseif has("win32")
    au GUIEnter * simalt ~x
    set shellslash
    set visualbell
    let $HOME=$VIM . "/../.."
    let $MYVIMRC=$HOME . "/Data/settings/vimrc"
endif
"Format the statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

""""" map
let mapleader = ","
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>
"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Parentheses words
map \p i(<Esc>ea)<Esc>
map \c i{<Esc>ea}<Esc>
"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
if has("win32")
nmap <Leader>t :!START cmd<CR>
endif

""""" encoding
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
endif
