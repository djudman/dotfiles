" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Кодировка UTF-8
set encoding=utf8
set fileencodings=utf8,cp1251

" Игнорировать регистр при поиске
set ignorecase

" Не игнорировать регистр, если в паттерне есть большие буквы
set smartcase

" Подсвечивать найденный паттерн
set hlsearch

" Интерактивный поиск
set incsearch

" Размер табов - 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Превратить табы в пробелы
set expandtab

" Таб перед строкой будет вставлять количество пробелов определённое в shiftwidth
set smarttab

" Копировать отступ на новой строке
set autoindent
set smartindent

" Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1

" Показывать номера строк
set number

" Автокомплиты в командной строке
set wildmode=longest,list

" Подсветка синтаксиса
syntax on

" Разрешить использование мыши
set mouse=a

set mousehide "Спрятать курсор мыши когда набираем текст

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Быстрый скроллинг
set ttyfast

" Курсор во время скроллинга будет всегда в середине экрана
set so=30

" Встроенный плагин для распознавания отступов
filetype plugin indent on

set novisualbell "Не мигать
set t_vb= "Не пищать

" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Вырубаем черточки на табах
set showtabline=1

" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

set ruler

set guifont="JetBrains Mono":h18
colorscheme OceanicNext

" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set termencoding=utf-8 "Кодировка терминала

" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile

" Переносим на другую строчку, разрываем строки
set wrap
set linebreak

" https://www.ditig.com/publications/256-colors-cheat-sheet#xterm-system-colors
highlight ColorColumn ctermbg=236 guibg=#dadada
set colorcolumn=80

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

"set cursorline
