" Map Taglist toggle shortcut
" 配置Taglist开关快捷键
map <C-T> :TlistToggle<CR>

" Forbid to display multiple tag files at the same time
" 禁止同时显示多个tag文件
let Tlist_Show_One_File = 1

" Close the vim if the taglist window is the only window
" 当taglist窗口是最后一个窗口时，关闭vim
let Tlist_Exit_OnlyWindow = 1

" Display taglist window at the right side
" 右侧显示Taglist窗口
let Tlist_Use_Right_Window = 1   

" Set the width of the taglist window
" 设置taglist窗口宽度
let Tlist_WinWidth = 40
