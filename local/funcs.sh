# git flow
push() {
    # Usage: push "Git commit message"
    git add .
    git commit -m $1
    git push
}

null_push() {
    # Usage: null_push
    git commit --allow-empty -m "Empty Commit" && git push
}

clean_branches() {
    # Usage: clean_branches
    git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
}

bulk_pull_main() {
    local d="$PWD"
    while [[ $# -gt 0 ]]; do
        case "$1" in
        -d | --dir)
            [[ -n "$2" ]] || {
                printf 'Error: %s requires a path\n' "$1" >&2
                return 1
            }
            d="$2"
            shift 2
            ;;
        -h | --help)
            printf 'Update multiple git repos within a directory\n'
            printf 'Usage: bulk_pull_main [options]\n'
            printf '\t-d, --dir <path>          \tset directory for update (defaults to current dir)\n'
            printf '\t-h, --help                \tdisplay this help text\n'
            return 0
            ;;
        *)
            printf 'Error: unknown option %s\n' "$1" >&2
            return 1
            ;;
        esac
    done

    [[ -d "$d" ]] || {
        printf 'Error: not a directory: %s\n' "$d" >&2
        return 1
    }

    local dir b cur
    for dir in "$d"/*(N/); do
        git -C "$dir" rev-parse --git-dir >/dev/null 2>&1 || continue

        b=$(git -C "$dir" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null)
        if [[ -z "$b" ]]; then
            git -C "$dir" remote set-head origin --auto >/dev/null 2>&1
            b=$(git -C "$dir" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null)
        fi
        b="${b#origin/}"
        if [[ -z "$b" ]]; then
            printf '%s: cannot determine default branch, skipping\n' "${dir:t}" >&2
            continue
        fi

        cur=$(git -C "$dir" symbolic-ref --quiet --short HEAD 2>/dev/null)
        if [[ "$cur" == "$b" ]]; then
            git -C "$dir" pull --ff-only origin "$b" ||
                printf '%s: ff-only pull of %s failed\n' "${dir:t}" "$b" >&2
        elif ! git -C "$dir" fetch origin "$b:$b" 2>/dev/null; then
            # branch checked out in another worktree, or non-ff — fall back to a plain fetch
            git -C "$dir" fetch origin "$b" ||
                printf '%s: fetch of %s failed\n' "${dir:t}" "$b" >&2
            printf '%s: %s not fast-forwarded (checked out elsewhere?)\n' "${dir:t}" "$b" >&2
        fi
    done
}
