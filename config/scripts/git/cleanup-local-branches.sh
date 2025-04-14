# Removes any local branches that are not tracking a remote branch.
git for-each-ref --format '%(refname:short) %(upstream:track)' |
  awk '$2 == "[gone]" {print $1}' |
  xargs -r git branch -D