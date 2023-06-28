"" The use of Flake8 has been deprecated

let g:no_flake8_maps = 0
let g:flake8_quickfix_location="bottom"
let g:flake8_quickfix_height=5
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0
let g:flake8_max_markers=500
let g:flke8_max_complexity=10
let g:flake8_error_marker='>>'
let g:flake8_warning_marker='--'
let g:flake8_pyflake_marker='M'
let g:flake8_complexity_marker='C'
let g:flake8_naming_marker='N'
let g:flake8_ignore="D400"

"" Error WarningMsg
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
