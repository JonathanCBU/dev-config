# Git Aliases

## TL;DR

__Add this to your `~/.gitconfig`__
```toml
[alias]
	s = status -sb
	ss = status
	c = commit -m
	ca = commit -am
	l1 = !git --no-pager log -1 HEAD
	l2 = !git --no-pager log -2 HEAD
	l3 = !git --no-pager log -3 HEAD
```

## Information Display

### Last commit info

```bash
git config --global alias.l1 '!git --no-pager log -1 HEAD'
```

### Last 2 commits

```bash
git config --global alias.l2 '!git --no-pager log -2 HEAD'
```

### Last 3 commits

```bash
git config --global alias.l3 '!git --no-pager log -3 HEAD'
```

### Status (compact)

```bash
git config --global alias.s 'status -sb'
```

### Status (standard)

```bash
git config --global alias.ss 'status'
```

## Change Management

### Commit With Message

```bash
git config --global alias.c 'commit -m'
```

### Commit All Unstaged With Message

```bash
git config --global alias.ca 'commit -am'
```
