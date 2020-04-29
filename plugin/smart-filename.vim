" This project is licensed under the MIT License (see LICENSE).

function! SmartFilename()
    let fname = expand('%:p')
    if fname !=# ''
        let root = FindRootDirectory()
        if root !=# '' && fname =~# '^' . root
            let head = fugitive#head()
            let branch = head !=# '' ? ':' . head : ''
            let project = '[' . fnamemodify(root, ':t') . branch . ']'
            let fname = substitute(fname, root, project, '')
        else
            " shorten $HOME to ~
            if fname =~# '^' . $HOME
                let fname = substitute(fname, $HOME, '~', '')
            endif
        endif
        " convert to floating point with * 1.0
        if strlen(fname) * 1.0 / winwidth(0) > 0.33
            let path = split(fname, '/')
            let spath = [path[0]]
            for p in path[1:-2]
                let spath += [strpart(p, 0, p[0] ==# '.' ? 2 : 1)]
            endfor
            let fname = join(spath, '/') . '/' . path[-1]
        endif
    else
        let fname = '[No Name]'
    endif
    return fname
endfunction
