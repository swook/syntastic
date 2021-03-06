"============================================================================
"File:        typescript/tslint.vim
"Description: TypeScript linter
"Maintainer:  Seon-Wook Park <seon.wook@swook.net>
"============================================================================

if exists("g:loaded_syntastic_typescript_tslint_checker")
    finish
endif
let g:loaded_syntastic_typescript_tslint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_typescript_tslint_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args': '--format prose',
        \ 'args_after': ' -f' })

    " Eg. ts/app.ts[12, 36]: comment must start with lowercase letter
    let errorformat = '%f[%l\, %c]: %m'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'bufnr': bufnr("")} })

    call self.setWantSort(1)

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'typescript',
    \ 'name': 'tslint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
