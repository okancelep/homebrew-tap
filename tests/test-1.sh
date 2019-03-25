#!/usr/bin/env bash
printf "\e[1;34m==> \e[1;39m"
echo -e 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"'
echo "y" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
  URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'
  printf "\e[1;34m==> \e[1;39m"
  echo -e '/usr/bin/ruby -e "$(curl -fsSL '$URL_BREW')"'
  echo 'Installing Homebrew ... '
  echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
  if [ $? -eq 0 ]; then echo 'Installed Homebrew'; else echo 'A error occoured while installing Homebrew.';exit 1; fi
printf "\e[1;34m==> \e[1;39m"
echo "brew tap smileycreations15/tap"
brew tap smileycreations15/tap
echo "Done adding tap"
for D in `find ./Formula -type f`
do
    name=$(basename ${D%.*})
    echo "Testing $name"
    printf "\e[1;34m==> \e[1;39m"
    echo "brew install $D --build-bottle"
    brew install $D --build-bottle
    if [ 0 != $? ]
    then
      echo "Failed to install $name"
      exit 2
    fi
    printf "\e[1;34m==> \e[1;39m"
    echo "brew postinstall $name"
    brew postinstall $name
    if [ 0 != $? ]
    then
      echo "Failed to install $name"
      exit 2
    fi
done
for D in `find ./Casks -type f`
do
    name=$(basename ${D%.*})
    echo "Testing cask $name"
    printf "\e[1;34m==> \e[1;39m"
    echo -e "brew cask install $D"
    brew cask install $D
    if [ 0 != $? ]
    then
      echo "Failed to install cask $name"
      exit 2
    fi
done
exit 0
