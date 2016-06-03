cd bdilate/repos
for dir in `find . -maxdepth 1 -mindepth 1 -type d -exec basename '{}' \; `;
do
  cd $dir

  for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
    git branch --track ${branch#remotes/origin/} $branch
  done

  cd ..
done
