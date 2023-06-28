" ALE
let g:ale_enabled = 1
let g:ale_max_signs = 10
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_echo_msg_format = "% code % [%linter%] %type% "
let g:ale_lsp_suggestions = 1

let g:ale_cursor_detail = 0 " 1 gives popup
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" let g:ale_use_neovim_diagnostics_api = 1 " DONT USE WITH g:ale_virturaltext_cursor
"" 0 No inline comments, 1 inline comments on with corsor on line, 2 inline on always
" let g:ale_virtualtext_cursor = 1

if has('nvim')
  let g:ale_use_neovim_diagnostics_api = 1 " DONT USE WITH g:ale_virturaltext_cursor
else
  let g:ale_virtualtext_cursor = 1
endif

let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_sign_column_always = 1

" Prevents highlights in the code proper. This is a list of strings
let g:ale_set_highlights = 1
let g:ale_exclude_highlights = [
      \ 'docstring',
      \ 'Unused argument',
      \ 'import-error',
      \ 'inconsistent-return-statements'
      \ ]

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'

let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_python_pylint_options = '--rcfile ~/python/pylint.conf'
