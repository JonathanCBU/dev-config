# dev-config

```bash
git clone git@github.com:JonathanCBU/dev-config.git ~/.dev-config
```

## ZSH

1. Install iTerm

2. Install oh-my-zsh

3. Symlink dotfile
```bash
ln -sf ~/.dev-config/zshrc ~/.zshrc
```

## NVIM

1. Install nvim

2. Create config dir
```bash
mkdir -p ~/.config/nvim
```

3. Create init symlink
```bash
ln -sf ~/.dev-config/nvim/init.lua ~/.config/nvim/init.lua
```

4. Create lua symlink
```bash
ln -sf ~/.dev-config/nvim/lua ~/.config/nvim/lua
```

