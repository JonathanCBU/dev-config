# git flow
push () {
	# Usage: push "Git commit message"
	git add .
	git commit -m $1
	git push
}
