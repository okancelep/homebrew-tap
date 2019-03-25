#!/bin/bash
pwd1=$(pwd)
if [[ "false" != $TRAVIS_PULL_REQUEST ]]
then
  echo "Detected a pull request. The 'Allow edits from maintainers' setting needs to be enabled."
fi
rm -r Bottles/
mkdir Bottles/
touch Bottles/.placeholder
  for D in `find ./Formula -type f`
  do
      name=$(basename ${D%.*})
      echo "Creating a bottle for $name"
      printf "\e[1;34m==> \e[1;39m"
      echo "brew bottle $name"
      cd Bottles
      brew bottle $name
      if [ 0 != $? ]
      then
        echo "Failed to bottle $name"
        exit 2
      fi
      cd ..

  done
cd $pwd1
BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)
echo "Bottles:"
ls Bottles/
echo "Pushing bottles to github.com/$TRAVIS_REPO_SLUG.git to branch $BRANCH from $(pwd)"
git config --global user.name "RepoDeployBot" > /dev/null 2>&1
git config --global user.email "48888406+RepoDeployBot@users.noreply.github.com" > /dev/null 2>&1
git add .
git status
git commit -m "Updated bottles"
git remote rm origin > /dev/null 2>&1
git remote add origin "https://RepoDeployBot:${GITHUB_KEY}@github.com/$TRAVIS_REPO_SLUG.git" > /dev/null 2>&1
git push origin $BRANCH
exit 0
