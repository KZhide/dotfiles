" load dein plugins

let s:dein_dir = expand(g:cache_home . '/dein')
if dein#load_state(s:dein_dir)
  let s:toml = g:config_home . '/nvim/dein/dein.toml'
  let s:ft_toml = g:config_home . '/nvim/dein/deinft.toml'
  let s:lazy_toml = g:config_home . '/nvim/dein/dein_lazy.toml'

  call dein#begin(s:dein_dir)

  call dein#load_toml(g:config_home . '/nvim/dein/dein.toml', {'lazy': 0})
  call dein#load_toml(g:config_home . '/nvim/dein/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml(g:config_home . '/nvim/dein/deinft.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
