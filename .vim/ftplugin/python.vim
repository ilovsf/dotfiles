" Python Config

" Implement a function to write the skeleton code automatically
function! GenerateHeader()
    call setline(1, "#! /usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "")
    call append(3, "# Description: ")
    call append(4, "# Author: Feng Liang")
    call append(5, "# Email: liangfeng1987@gmail.com")
    call append(6, "# Date: " . strftime("%Y-%m-%d %H:%M:%S"))
    call append(7, "# Last Modified: " . strftime("%Y-%m-%d %H:%M:%S"))

    " Go to the Description line and then move the cursor to the EOL
    normal 4gg
    normal A
    startinsert
endf

" Implement a function to change the modified time
function! ModifyDate()
    if search("Last Modified") != 0
        let line = line('.')
        call setline(line, "# Last Modified: " . strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunction

" Check whether the current file is empty
if getfsize(@%) == -1
    " If current file is empty, generate the header
    call GenerateHeader()
else
    " Else change the modified time
    call ModifyDate()
endif

" Re-map Flake8 shortcut when python filetype detected
" 重新映射调用Flake8插件的快捷键，当当前文件时python文件时
map <silent> <leader>f :call Flake8()<CR>
