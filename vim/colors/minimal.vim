" Минималистичная светлая схема: белый фон, чёрный текст,
" синие зарезервированные слова, зелёные строки, фиолетовые числа,
" magenta — имена функций и методов.
" Группы, которым цвет не назначен явно, выводятся обычным текстом.

set background=light
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'minimal'

let s:normal      = 'ctermfg=16   ctermbg=231  cterm=NONE   guifg=#000000 guibg=#ffffff gui=NONE'
let s:comment     = 'ctermfg=247  ctermbg=NONE cterm=NONE   guifg=#9e9e9e guibg=NONE    gui=NONE'
let s:todo        = 'ctermfg=247  ctermbg=NONE cterm=bold   guifg=#9e9e9e guibg=NONE    gui=bold'
let s:keyword     = 'ctermfg=27   ctermbg=NONE cterm=NONE   guifg=#0000c0 guibg=NONE    gui=NONE'
let s:string      = 'ctermfg=28   ctermbg=NONE cterm=NONE   guifg=#008700 guibg=NONE    gui=NONE'
let s:number      = 'ctermfg=91   ctermbg=NONE cterm=NONE   guifg=#7f00af guibg=NONE    gui=NONE'
let s:selection   = 'ctermfg=231  ctermbg=27   cterm=NONE   guifg=#ffffff guibg=#0000c0 gui=NONE'
let s:search      = 'ctermfg=16   ctermbg=229  cterm=NONE   guifg=#000000 guibg=#ffffaf gui=NONE'
let s:linenr      = 'ctermfg=250  ctermbg=NONE cterm=NONE   guifg=#bcbcbc guibg=NONE    gui=NONE'
let s:split       = 'ctermfg=253  ctermbg=NONE cterm=NONE   guifg=#dadada guibg=NONE    gui=NONE'
let s:linenr_cur  = 'ctermfg=16   ctermbg=NONE cterm=bold   guifg=#000000 guibg=NONE    gui=bold'
let s:cursorline  = 'ctermfg=NONE ctermbg=189  cterm=NONE   guifg=NONE    guibg=#f2f6ff gui=NONE'
let s:column      = 'ctermfg=NONE ctermbg=255  cterm=NONE   guifg=NONE    guibg=#e8e8e8 gui=NONE'
let s:statusline  = 'ctermfg=16   ctermbg=255  cterm=NONE   guifg=#000000 guibg=#e8e8e8 gui=NONE'
let s:statusline_nc = 'ctermfg=250 ctermbg=255 cterm=NONE   guifg=#bcbcbc guibg=#e8e8e8 gui=NONE'
let s:function    = 'ctermfg=127  ctermbg=NONE cterm=NONE   guifg=#af00af guibg=NONE    gui=NONE'
let s:incsearch   = 'ctermfg=16   ctermbg=229  cterm=bold   guifg=#000000 guibg=#ffffaf gui=bold'
let s:reverse     = 'ctermfg=NONE ctermbg=NONE cterm=reverse guifg=NONE    guibg=NONE    gui=reverse'

" Зарезервированные слова, директивы препроцессора, макросы
for s:group in ['Statement', 'Keyword', 'Conditional', 'Repeat', 'Label', 'Operator',
      \ 'Exception', 'PreProc', 'Include', 'Define', 'Macro', 'PreCondit']
  execute 'hi' s:group s:keyword
endfor

" Строки и символьные литералы
for s:group in ['String', 'Character']
  execute 'hi' s:group s:string
endfor

" Числа
for s:group in ['Number', 'Boolean', 'Float']
  execute 'hi' s:group s:number
endfor

execute 'hi Normal' s:normal
for s:group in ['NonText', 'EndOfBuffer', 'Comment']
  execute 'hi' s:group s:comment
endfor

" Имена функций и методов — magenta. Файловые группы (pythonFunction, vimFunction
" и т. п.) по умолчанию ведут на Function, поэтому per-language правил не нужно
execute 'hi Function' s:function

" Всё остальное — обычным чёрным текстом; имена классов и структур (Type,
" Structure) сюда же: раньше они были жирными, теперь не выделяются
for s:group in ['Identifier', 'StorageClass', 'Typedef', 'Constant', 'Type',
      \ 'Structure', 'Special', 'SpecialChar', 'Delimiter', 'Tag', 'Debug',
      \ 'Title', 'Underlined', 'Ignore', 'Error']
  execute 'hi!' 'link' s:group 'Normal'
endfor
hi! link SpecialComment Comment

" TODO:/FIXME: в комментариях — жирным
execute 'hi Todo' s:todo

" Языковые группы
" встроенные имена (int, str, bytes, len, ...) и типы — как зарезервированные слова
hi! link pythonBuiltin    Statement
hi! link pythonType       Statement
hi! link pythonExceptions Normal
hi! link pythonDecorator  Normal
hi! link pythonOperator   Operator
" self и cls (pythonClassVar) — как зарезервированные слова; по умолчанию группа
" ведёт на Identifier, который схема делает обычным текстом
hi! link pythonClassVar   Keyword

hi! link shQuote          String
hi! link shComment        Comment
hi! link jsonString       String
hi! link jsonNumber       Number

" Поиск, выделение, служебные области
execute 'hi Search' s:search
execute 'hi Visual' s:selection
execute 'hi IncSearch' s:incsearch
execute 'hi MatchParen' s:selection
execute 'hi CursorLine' s:cursorline
" Курсор-блок: белый текст на чёрном блоке, чтобы буква под курсором читалась
execute 'hi Cursor ctermfg=231 ctermbg=16 guifg=#ffffff guibg=#000000'
execute 'hi lCursor ctermfg=231 ctermbg=16 guifg=#ffffff guibg=#000000'
execute 'hi CursorLineNr' s:linenr_cur
execute 'hi LineNr' s:linenr
execute 'hi ColorColumn' s:column
" в Neovim подсветка столбца идёт отдельной группой
execute 'hi ColorColumnNC' s:column
execute 'hi VertSplit' s:split
execute 'hi StatusLine' s:statusline
execute 'hi StatusLineNC' s:statusline_nc

" Окна автодополнения и всплывающие меню
execute 'hi Pmenu' s:normal
execute 'hi PmenuSel' s:selection
hi! link PmenuSbar  Normal
hi! link PmenuThumb Normal

" diff
execute 'hi DiffAdd ctermfg=28 ctermbg=NONE cterm=NONE guifg=#008700 guibg=NONE gui=NONE'
execute 'hi DiffDelete ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE'
execute 'hi DiffChange ctermfg=27 ctermbg=NONE cterm=NONE guifg=#0000c0 guibg=NONE gui=NONE'
execute 'hi DiffText ctermfg=91 ctermbg=NONE cterm=bold guifg=#7f00af guibg=NONE gui=bold'

" Диагностика (ALE, Syntastic, LSP)
hi! link ALEError   Normal
hi! link ALEWarning Normal
execute 'hi ALEInfo ctermfg=27 guifg=#0000c0'
execute 'hi SpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e'
