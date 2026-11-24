" Штатный python.vim размечает только определения (pythonFunction после def),
" поэтому вызовы super().__init__() и Repository.__init__() остаются обычным
" текстом. Группа ведётся на Function, цвет берётся из цветовой схемы.
" hi def, а не hi: схема может переопределить группу своим цветом.
syn match pythonInitName /\<__init__\>/
hi def link pythonInitName Function
