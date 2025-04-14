if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish | source
#eval "$(oh-my-posh init fish --config /home/ckidney/posh-themes/themes/lambdageneration.omp.json)"
eval "$(oh-my-posh init fish --config /usr/share/oh-my-posh/themes/catppuccin_mocha.omp.json)"

fastfetch -l ARCHlabs

# Set up fzf key bindings
fzf --fish | source

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

zoxide init fish | source
