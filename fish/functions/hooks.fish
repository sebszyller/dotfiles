function __direnv_cd_hook --on-variable PWD;
    eza
end

function sync_history --on-event fish_preexec
    history --save
    history --merge
end
