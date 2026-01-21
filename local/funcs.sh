# git flow
push() {
    # Usage: push "Git commit message"
    git add .
    git commit -m $1
    git push
}

update_repo() {
    local repo="$1"
    local repo_path="$HOME/Rokt/$repo"

    if [ -d "$repo_path" ]; then
        echo "=== Updating $repo ==="
        cd "$repo_path" || return 1
        git checkout master && git pull
        echo ""
    else
        echo "Warning: Directory $repo_path not found, skipping..."
        echo ""
        return 1
    fi
}

null_push() {
    # Usage: null_push
    git commit --allow-empty -m "Empty Commit" && git push
}

clean_branches() {
    # Usage: clean_branches
    git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
}
