" 'rust': ['analyzer', 'rustc', 'cargo'],
" 'python': ['pylint', 'isort', 'mypy', 'pyright', 'ruff'],
let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'rust': ['analyzer'],
      \ 'vim': [''],
      \ 'cpp': ['clangd', 'cpplint'],
      \ 'json': ['eslint'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black', 'isort'],
      \ 'rust': ['rustfmt'],
      \ 'cpp': ['clang-format'],
      \ 'json': ['prettier'],
      \}
