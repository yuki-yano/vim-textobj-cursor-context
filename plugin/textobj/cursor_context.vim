if exists('g:loaded_textobj_cursor_context')
  finish
endif

call textobj#user#plugin('cursorcontext', {
\  '-': {
\    'select-a': 'ac', '*select-a-function*': 'textobj#cursor_context#select_a',
\    'select-i': 'ic', '*select-i-function*': 'textobj#cursor_context#select_i',
\  },
\})

let g:loaded_textobj_cursor_context = 1
