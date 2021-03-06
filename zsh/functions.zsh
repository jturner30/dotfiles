nb() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref head)
  git checkout -b johnt/$CURRENT_BRANCH/$1
}

pr() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  PARENT_BRANCH=$(echo $CURRENT_BRANCH | cut -d '/' -f2)
  REPO_NAME=$(basename `git rev-parse --show-toplevel`)
  git push -u origin $CURRENT_BRANCH
  x-www-browser "https://github.com/sqsp/$REPO_NAME/compare/$CURRENT_BRANCH?expand=1"
}

watch(){
  CTIME=$(stat -f "%m" scratch);
  FILE=$1
  CMD=$2
  clear
  echo "Watching $FILE..."
  while true; do
    if [ $(stat -f "%m" $FILE) -gt $CTIME ]
      then
        clear
        echo "$FILE changed. Executing $CMD"
        echo "==========================="
        CTIME=$(stat -f "%m" $FILE);
        $CMD;
        echo "==========================="
        echo "Watching $FILE..."
    fi
    sleep 1;
  done
}

backmerge() {
  echo "---Refreshing repository---"
  git up && \
  echo "---Backmerging stage---"
  git checkout stage && \
  git merge master && \
  git push && \
  echo "---Backmerging develop---"
  git checkout develop && \
  git merge stage && \
  git push
  echo "---Done!---"
}

# Find and replace. Depends on ripgrep
fr() {
  dir=$1
  find_this=$2
  replace_with_this=$3

  rg -l $find_this $dir | xargs -n1 sed -i'' s/$find_this/$replace_with_this/g
}
