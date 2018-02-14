"FUNCTIONS
"------------------------------------------------------------

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

let g:colorscheme_plan=[]

let g:current_pos = 0

function! CycleColor()
    let g:current_pos = (g:current_pos+1)%len(g:colorscheme_plan)
    if !empty(g:colorscheme_plan)
        set t_Co=256
        exe "colorscheme default"
        exe "set background=".g:colorscheme_plan[g:current_pos]['background']
        exe "colorscheme ".g:colorscheme_plan[g:current_pos]['colorscheme']
        if exists(':AirlineTheme')
            if exists("g:colorscheme_plan[g:current_pos]['airline']")
                exe "AirlineTheme ".g:colorscheme_plan[g:current_pos]['airline']
            else
                exe "AirlineTheme ".g:colorscheme_plan[g:current_pos]['background']
            endif
            if exists(':Tmuxline')
                if exists('$TMUX')
                    exe "Tmuxline airline"
                endif
            endif
        endif
    endif
endfu

function! ToggleTabHere()
    if g:NERDTree.IsOpen()
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction
