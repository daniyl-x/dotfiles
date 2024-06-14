return {
    texlab = {
        -- Error checking
        chktex = {
            onEdit = true,
            onOpenAndSave = true,
        },
        build = {
            executable = "pdflatex",
            args = {"%f"},
            onSave = true,
        }
    }
}

