if (exists("g:neovide") && g:neovide)
        let g:neovide_cursor_animation_length=0.1
        let g:neovide_cursor_trail_size=0.75
        let g:neovide_cursor_vfx_mode="wireframe"
        let g:neovide_no_idle=v:true

        set guifont=Cica:h17
else
        echom "no neovide, ignored config..."
endif
