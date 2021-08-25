function! textobj#cursor_context#select_a()
  let start_line_num = -1
  let end_line_num = line('$')
  let [_, current_line_num, current_col, _] = getpos('.')

  let i = current_line_num
  let line = getline(i)
  let prev_line = getline(i - 1)

  if line[current_col - 1] =~# '\s' || prev_line[current_col - 1] =~# '\s'
    let i = i - 1
    while i >= 0
      let line = getline(i)
      if line[current_col - 1] =~# '\s' || line[current_col - 1] ==# ''
        let i = i - 1
      else
        let start_line_num = i
        break
      endif
    endwhile
  else
    let start_line_num = i
  endif

  let i = current_line_num
  let line = getline(i)
  let next_line = getline(i + 1)

  if line[current_col - 1] =~# '\s' || next_line[current_col - 1] =~# '\s'
    let i = i + 1
    while i <= end_line_num
      let line = getline(i)
      if line[current_col - 1] =~# '\s' || line[current_col - 1] ==# ''
        let i = i + 1
      else
        let end_line_num = i
        break
      endif
    endwhile
  else
    let end_line_num = i
  endif

  if start_line_num == -1 || end_line_num == -1
    return 0
  endif

  return ['v', [0, start_line_num, 1, 0], [0, end_line_num, len(getline(end_line_num)) + 1, 0]]
endfunction

function! textobj#cursor_context#select_i()
  let start_line_num = -1
  let end_line_num = line('$')
  let [_, current_line_num, current_col, _] = getpos('.')

  let i = current_line_num
  let line = getline(i)
  let prev_line = getline(i - 1)

  if line[current_col - 1] =~# '\s' || prev_line[current_col - 1] =~# '\s'
    let i = i - 1
    while i >= 0
      let line = getline(i)
      if line[current_col - 1] =~# '\s' || line[current_col - 1] ==# ''
        let i = i - 1
      else
        let start_line_num = i
        break
      endif
    endwhile
  else
    let start_line_num = i
  endif

  let i = current_line_num
  let line = getline(i)
  let next_line = getline(i + 1)

  if line[current_col - 1] =~# '\s' || next_line[current_col - 1] =~# '\s'
    let i = i + 1
    while i <= end_line_num
      let line = getline(i)
      if line[current_col - 1] =~# '\s' || line[current_col - 1] ==# ''
        let i = i + 1
      else
        let end_line_num = i
        break
      endif
    endwhile
  else
    let end_line_num = i
  endif

  if start_line_num == -1 || end_line_num == -1
    return 0
  endif

  if start_line_num < end_line_num
    return ['v', [0, start_line_num + 1, 1, 0], [0, end_line_num - 1, len(getline(end_line_num - 1)) + 1, 0]]
  else
    return ['v', [0, start_line_num, 1, 0], [0, end_line_num, len(getline(end_line_num)) + 1, 0]]
  endif
endfunction
