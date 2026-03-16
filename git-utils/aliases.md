# Git Aliases

## Information Display

### Last commit info

```bash
git config --global alias.l1 'log -1 HEAD'
```

### Last 2 commits

```bash
git config --global alias.l2 'log -2 HEAD'
```

### Last 3 commits

```bash
git config --global alias.l3 'log -3 HEAD'
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
