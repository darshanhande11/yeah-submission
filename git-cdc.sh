#!/bin/bash
# commit
# date YYYY-mm-dd HH:MM:SS

commit="$1" datecal="$2" localTime="$3"
temp_branch="temp-rebasing-branch"
current_branch="$(git rev-parse --abbrev-ref HEAD)"
echo "this is local time" $localTime
# date
date_timestamp=$(date -d "$datecal $localTime" +%s)
date_r=$(date -R -d "$datecal $localTime")

if [[ -z "$commit" ]]; then
    exit 0
fi

# git checkout -b "$temp_branch" "$commit"
# GIT_COMMITTER_DATE="$date_timestamp" GIT_AUTHOR_DATE="$date_timestamp" git commit --amend --no-edit --date "$date_r"
# git checkout "$current_branch"
# git rebase  --autostash --committer-date-is-author-date "$commit" --onto "$temp_branch"
# git branch -d "$temp_branch"

git filter-branch --env-filter \
    `if [ $GIT_COMMIT = $commit ]
     then
         export GIT_AUTHOR_DATE="$date_timestamp"
         export GIT_COMMITTER_DATE="$date_timestamp"
     fi`