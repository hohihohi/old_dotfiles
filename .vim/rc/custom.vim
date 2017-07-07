if !exists('g:config')
  finish
endif

if g:plug.is_installed('enhancd')
  let g:enhancd_action = g:plug.is_installed('dirvish') ? 'Dirvish' : 'Ex'
endif

if g:plug.is_installed('caw')
  vmap <C-k> <Plug>(caw:i:toggle)
  vmap K     <Plug>(caw:i:toggle)
endif

if g:plug.is_installed('anzu')
  nmap n <Plug>(anzu-n)
  nmap N <Plug>(anzu-N)
  nmap * <Plug>(anzu-star)
  nmap # <Plug>(anzu-sharp)
  nmap n <Plug>(anzu-n-with-echo)
  nmap N <Plug>(anzu-N-with-echo)
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)

  augroup vim-anzu
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
  augroup END
endif

if g:plug.is_installed('fzf.vim')
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'tab split',
        \ 'ctrl-v': 'tab split' }

  function! s:search_with_ag_under_cursor()
    let g:env.vimrc.auto_cd_file_parentdir = g:false
    let cwd = expand('%:p:h')
    silent! call s:root()

    call fzf#vim#ag(expand('<cword>'), {
          \ 'sink': 'edit',
          \ 'options': '--ansi --delimiter : --nth 4..,.. --prompt "Ag?> " '.
          \            '--color hl:68,hl+:110 --multi '.
          \            '--bind=ctrl-d:page-down,ctrl-u:page-up ',
          \ 'tmux_height': '40%',
          \ })
    "execute 'lcd' cwd
    execute 'lcd' expand('%:p:h')
    let g:env.vimrc.auto_cd_file_parentdir = g:true
  endfunction
  nnoremap <silent> K :call <SID>search_with_ag_under_cursor()<CR>

  nnoremap <silent> <Leader>m :call fzf#run({
        \ 'source': 'sed "1d" $HOME/.vim_mru_files',
        \ 'options' : '+s -e -m',
        \ 'tmux_height': '40%',
        \ 'sink': 'tabe'
        \ })<CR>
endif

if g:plug.is_installed('vim-dirvish')
  " Override netrw
  let g:dirvish_hijack_netrw = 1

  augroup my_dirvish_events
    au!
    " always show hidden files
    au User DirvishEnter let b:dirvish.showhidden = 1
  augroup END

  nnoremap <silent> [Space]d :<C-u>call <SID>toggle_dirvish()<CR>
  function! s:toggle_dirvish()
    if &filetype == 'dirvish'
      if exists('b:dirvish')
        if winnr('$') > 1
          wincmd c
        else
          bdelete
        endif
      endif
    else
      Dirvish
    endif
  endfunction
endif

if g:plug.is_installed('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case = 1
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#manual_completion_start_length = 0
  let g:neocomplete#min_keyword_length = 3
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:jedi#auto_vim_configuration = 0
  let g:neocomplete#sources#omni#input_patterns = {
        \ 'ruby' : '[^. *\t]\.\w*\|\h\w*::',
        \}
  let g:neocomplete#force_omni_input_patterns = {
        \ 'python': '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
        \}

  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#disable_auto_select_buffer_name_pattern =
        \ '\[Command Line\]'
  let g:neocomplete#max_list = 100
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#enable_auto_close_preview = 1

  let g:neocomplete#force_omni_input_patterns.markdown =
        \ ':\w*'
  let g:neocomplete#force_omni_input_patterns.ruby =
        \ '[^. *\t]\.\w*\|\h\w*::\w*'

  let g:neocomplete#force_omni_input_patterns.python =
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

  let g:neocomplete#sources#omni#functions.go =
        \ 'gocomplete#Complete'

  let g:neocomplete#sources#omni#input_patterns.php =
        \'\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

  let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
endif

if g:plug.is_installed('mru.vim')
  let MRU_Auto_Close = 1
  let MRU_Window_Height = 30
  let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
  let MRU_Max_Entries = 1000
  nnoremap <silent> [Space]j :<C-u>MRU<CR>
endif

if g:plug.is_installed('vim-sqlfmt')
  let g:sqlfmt_command = "sqlformat"
  let g:sqlfmt_options = "-r -k upper"
  let g:sqlfmt_auto = true
endif

if g:plug.is_installed('syntastic')
  let g:syntastic_mode_map = { 'mode': 'passive',
        \ 'active_filetypes': ['go'] }
  let g:syntastic_go_checkers = ['go', 'golint']
endif

if g:plug.is_installed('')
endif
